//
//  ViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 07/06/2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let emailButton = UIButton(title: Constants().emailStr , titleColor: .white, backgroundColor:.backGroundButton() )
    
    let loginButton = UIButton(title: Constants().loginStr, titleColor: .redButton(), backgroundColor: .white, isShadow: true)
    
    let googleButton = UIButton(title: Constants().googleStr, titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailLabel = UILabel(title: Constants().signUpWithStr, textColor: .black, font: .helvetica18())
    let googleLabel = UILabel(title: Constants().getStartetWithStr, textColor: .black, font: .helvetica18())
    let withUsLabel = UILabel(title: Constants().alreadyWithUsStr, textColor: .black, font: .helvetica18())
    let logoImage = UIImageView(image: UIImage(named: "darkMode"), contentMode: .scaleAspectFill)
    
    let signUpVc = SignUpViewController()
    let loginVc = LogInViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
        targetsForButtons()
        signUpVc.delegate = self
        loginVc.delegate = self
    }
    
    func targetsForButtons() {
        emailButton.addTarget(self, action: #selector(emailTapButton), for: .touchUpInside)
       // googleButton.addTarget(self, action: #selector(googleTapButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapButton), for: .touchUpInside)
    
    }
  
    
    @objc private func emailTapButton() {
        present(signUpVc, animated: true, completion: nil)
    }
    @objc private func loginTapButton() {
        present(loginVc, animated: true, completion: nil)
    }

}

//MARK: - Constraints setup
extension AuthViewController {
    private func setupConstraints() {
        
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: withUsLabel, button: loginButton)
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spasing: 60)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(logoImage)
        view.addSubview(stackView)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
            
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
//MARK: - AuthNavigationDelegate

// go to view controllers from another VC
extension AuthViewController: AuthNavigationDelegate {
    func toLoginVc() {
        present(loginVc, animated: true, completion: nil)
    }
    
    func tosignUpVc() {
        present(signUpVc, animated: true, completion: nil)
    }
}

//MARK: - SwiftUI
import SwiftUI

struct AuthVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

