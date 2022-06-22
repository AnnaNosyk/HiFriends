//
//  ProfileViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 21/06/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let container = UIView()
    let image = UIImageView(image: UIImage(named: "human3"), contentMode: .scaleAspectFill)
    let name = UILabel(title: "Mark Harris", textColor: .textMainColor(), font: .helvetica20())
    let about = UILabel(title: "I want to find new friends", textColor: .textDescriptionColor(), font: .helvetica16())
    let textField = CustomTexfield()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeEements()
        setupConstrains()
    }
    
    func customizeEements() {
        container.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        about.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        about.numberOfLines = 0
        container.backgroundColor = .mainColor()
        container.layer.cornerRadius = 30
        textField.borderStyle = .roundedRect
        if let button = textField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage)  , for: .touchUpInside)
        }
    }
    
    @objc private func sendMessage() {
        print(#function)
    }
    
}

// MARK: - Setup Layout
extension ProfileViewController {
    
    private func setupConstrains() {
        view.addSubview(image)
        view.addSubview(container)
        container.addSubview(name)
        container.addSubview(about)
        container.addSubview(textField)
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: container.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: container.topAnchor, constant: 35),
            name.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24)
        ])
        
        
        NSLayoutConstraint.activate([
            about.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            about.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            about.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24)
            
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
        
        
        
        
    }
}


//MARK: - SwiftUI
import SwiftUI

struct ProfileVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = ProfileViewController()
        func makeUIViewController(context: Context) -> ProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
