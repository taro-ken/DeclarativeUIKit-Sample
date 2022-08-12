//
//  DeclarativeViewController.swift
//  DeclarativeUIKit-Sample
//
//  Created by 木元健太郎 on 2022/08/12.
//

import UIKit
import DeclarativeUIKit
import SwiftUI


final class DeclarativeViewController: UIViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           self.view.backgroundColor = .white

           self.declarative {
               UIScrollView.vertical {
                   UIStackView.vertical {

                       UIView()
                         .imperative { view in
                             print("命令的に記述も可能")
                             view.tintColor = .black
                             view.isUserInteractionEnabled = true
                         }
                         .size(width: 100, height: 100)
                         .backgroundColor(.blue)
                         .transform(.init(rotationAngle: 45.0 / 360 * Double.pi))
                         .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                         .border(color: .blue, width: 10)
                         .customSpacing(40)

                       UIButton()
                           .title("button", for: .normal)
                           .titleColor(.brown, for: .normal)
                           .add(target: self, for: .touchUpInside, { _ in
                               print("タッチアクション")
                           })

                       Array(1 ... 10).compactMap { num in
                           UILabel("\(num)番目のlabel")
                               .textColor(.black)
                               .textAlignment(.center)
                       }
                       
                       UISwitch()
                           .add(target: self, for: .allEvents, { _ in
                               print("hoge")
                           })

                       UIView.spacer()
                   }
                   .spacing(20)
               }
           }
       }
}

struct DeclarativeViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = DeclarativeViewController

    func makeUIViewController(context: Context) -> ViewController {
        let vc = DeclarativeViewController()
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct DeclarativeViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DeclarativeViewController_Wrapper()
        }
    }
}
