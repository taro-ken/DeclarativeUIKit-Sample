//
//  DeclarativeViewController.swift
//  DeclarativeUIKit-Sample
//
//  Created by 木元健太郎 on 2022/08/12.
//

import UIKit
import DeclarativeUIKit


extension Notification.Name {
    static let injection = Notification.Name("INJECTION_BUNDLE_NOTIFICATION")
}

extension NotificationCenter {
    func addInjectionObserver(_ observer: Any, selector: Selector, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .injection, object: object)
    }
}


final class DeclarativeViewController: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        NotificationCenter.default.addInjectionObserver(self, selector: #selector(setupLayout), object: nil)
        setupLayout()
    }
}

@objc private extension DeclarativeViewController {
    func setupLayout() {
        //初期時に画面を白にしておく
        self.view.backgroundColor = .white
        
        self.declarative {
            UIStackView.vertical {
                UILabel()
                    .imperative { label in
                    let label = label as! UILabel
                    label.text = "hogehoge"
                }
                .backgroundColor(.gray)
                .height(100)
                
                UIView()
                    .imperative { view in
                        view.tintColor = .black
                        view.isUserInteractionEnabled = true
                    }
                UIView.spacer()
                    .backgroundColor(.brown)
            }
        }
    }
}
