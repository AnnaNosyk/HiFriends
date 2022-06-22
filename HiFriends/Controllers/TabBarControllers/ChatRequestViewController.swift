//
//  ChatRequestViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 22/06/2022.
//

import UIKit

class ChatRequestViewController: UIViewController {

    let container = UIView()
    let image = UIImageView(image: UIImage(named: "human4"), contentMode: .scaleAspectFill)
    let name = UILabel(title: "Maria Martins", textColor: .textMainColor(), font: .helvetica20())
    let about = UILabel(title: "Do you want to start new chat?", textColor: .textDescriptionColor(), font: .helvetica16())
    
    let acceptButton = UIButton(title: "ACEPT", titleColor: .white, backgroundColor: .black, font: .helvetica20())
    
    let denyButton = UIButton(title: "DENY", titleColor: .white, backgroundColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeEements()
        setupConstrains()
    }
    
   private func customizeEements() {
       denyButton.layer.borderWidth = 1.2
       denyButton.layer.backgroundColor = UIColor.redButton().cgColor
       
        container.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        about.translatesAutoresizingMaskIntoConstraints = false
        about.numberOfLines = 0
        container.backgroundColor = .mainColor()
        container.layer.cornerRadius = 30
      
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        acceptButton.applyGradients(cornerRadius: 10)
    }


}

// MARK: - Setup Layout
extension ChatRequestViewController {
    private func setupConstrains() {
        let stackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spasing: 7)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(image)
        view.addSubview(container)
        container.addSubview(name)
        container.addSubview(about)
        container.addSubview(stackView)
        
        
        
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
            stackView.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 60)
            
        ])

        
    }
    
}




//MARK: - SwiftUI
import SwiftUI

struct RequestVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = ChatRequestViewController()
        func makeUIViewController(context: Context) -> ChatRequestViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
