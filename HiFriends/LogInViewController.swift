//
//  LogInViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 09/06/2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let welcomeBackLabel = UILabel(title: Constants().welcomeBackStr, textColor: .black, font: .helvetica26())
    let loginWithabel = UILabel(title: Constants().loginWithStr, textColor: .black, font: .helvetica18())
    let orLabel = UILabel(title: Constants().orStr, textColor: .black, font: .helvetica18())
    let emailLabel = UILabel(title: Constants().emailStr, textColor: .black, font: .helvetica18())
    let passwordLabel = UILabel(title: Constants().passwordStr, textColor: .black, font: .helvetica18())
    let needLabel = UILabel(title: Constants().needAnAccountStr, textColor: .black, font: .helvetica18())
    
    let googleButton = UIButton(title: Constants().googleStr, titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailTextField = OneLineTextField(font: .helvetica20())
    let passwordTextField = OneLineTextField(font: .helvetica20())
    
    let loginButton = UIButton(title: Constants().loginStr, titleColor: .white, backgroundColor: .backGroundButton())
    
    let signInButton = UIButton(title: Constants().signUpStr, titleColor: .redButton(), backgroundColor: .white, cornerRadius: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

//MARK: - Constraints setup
extension LogInViewController {
   private  func setupConstraints() {
        
       let loginWithView = ButtonFormView(label: loginWithabel, button: googleButton)
       let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spasing: 0)
       let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spasing: 0)
       loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
       let stackView = UIStackView(arrangedSubviews: [loginWithView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spasing: 40)
       
       signInButton.contentHorizontalAlignment = .leading
       let bottomStackView = UIStackView(arrangedSubviews: [needLabel, signInButton], axis: .horizontal, spasing: 10)
       bottomStackView.alignment = .firstBaseline
       
       welcomeBackLabel.translatesAutoresizingMaskIntoConstraints = false
       stackView.translatesAutoresizingMaskIntoConstraints = false
       bottomStackView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(welcomeBackLabel)
       view.addSubview(stackView)
       view.addSubview(bottomStackView)
       
       NSLayoutConstraint.activate([
           welcomeBackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
           welcomeBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       ])
       NSLayoutConstraint.activate([
           stackView.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 100),
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
       ])
       NSLayoutConstraint.activate([
           bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
           bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
           bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
       ])
       
    }
}

//MARK: - SwiftUI
import SwiftUI

struct LogInVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = LogInViewController()
        func makeUIViewController(context: Context) -> LogInViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
