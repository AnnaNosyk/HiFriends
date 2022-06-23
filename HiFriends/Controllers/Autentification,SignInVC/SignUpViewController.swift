//
//  SignUpViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 09/06/2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let welcomeLabel = UILabel(title: Constants().welcomeStr, textColor: .black, font: .helvetica26())
    let emailLabel = UILabel(title: Constants().emailStr, textColor: .black, font: .helvetica18())
    let passwordLabel = UILabel(title: Constants().passwordStr, textColor: .black, font: .helvetica18())
    let confirmPasswordLabel = UILabel(title: Constants().confirmPassword, textColor: .black, font: .helvetica18())
    let withUsLabel = UILabel(title: Constants().alreadyWithUsStr, textColor: .black, font: .helvetica18())
    
    let signUPButton = UIButton(title: Constants().signUpStr, titleColor: .white, backgroundColor: .backGroundButton(), cornerRadius: 10)
    let loginButton = UIButton(title: Constants().loginStr, titleColor: .redButton(), backgroundColor: .white, cornerRadius: 0)
    
    let emailTextField = OneLineTextField(font: .helvetica20())
    let passwordTextField = OneLineTextField(font: .helvetica20())
    let confirmPasswordTextField = OneLineTextField(font: .helvetica20())
    let setUpProfileVc = SetUpProfileViewController()
    
    weak var delegate: AuthNavigationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        view.backgroundColor = .white
        setupConstraints()
        signUPButton.addTarget(self, action: #selector(signUpTapButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapButton), for: .touchUpInside)
        
    }
    
    
    
    @objc private func signUpTapButton() {
        print(#function)
        AuthService.shared.registration(email: emailTextField.text, password: passwordTextField.text, confPassword: confirmPasswordTextField.text) { result in
            switch result {
            case .success(let user):
                self.showAlert(with: "Success", and: "login is completed") { [self] in
                    present(setUpProfileVc, animated: true, completion: nil)
                }
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
    }
    
    // go to loginVc
    @objc private func loginTapButton() {
        self.dismiss(animated: true) {
            self.delegate?.toLoginVc()
        }
    }

}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

extension SignUpViewController {
    
    private func setupConstraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spasing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spasing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spasing: 0)
      
        signUPButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUPButton], axis: .vertical, spasing: 40)
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [withUsLabel, loginButton], axis: .horizontal, spasing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),
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

struct SignUpVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = SignUpViewController()
        func makeUIViewController(context: Context) -> SignUpViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
