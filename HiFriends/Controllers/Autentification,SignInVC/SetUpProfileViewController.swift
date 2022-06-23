//
//  SetUpProfileViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 10/06/2022.
//

import UIKit

class SetUpProfileViewController: UIViewController {

    let welcomeBackLabel = UILabel(title: "Set up profile", textColor: .black, font: .helvetica26())
    let fullNameLabel = UILabel(title: "Full name", textColor: .black, font: .helvetica18())
    let aboutLabel = UILabel(title: "About me", textColor: .black, font: .helvetica18())
    let sexLabel = UILabel(title: "Sex", textColor: .black, font: .helvetica18())
 
    let FullNameTextField = OneLineTextField(font: .helvetica20())
    let aboutTextField = OneLineTextField(font: .helvetica20())
    let sexSegmentControll = UISegmentedControl(first: "Male", second: "Female")
    let startButton = UIButton(title: "Start chats  ", titleColor: .white, backgroundColor: .backGroundButton())
    
    
    let imageView = AddPhotoView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
}




//MARK: - Constraints setup
extension SetUpProfileViewController {
    
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, FullNameTextField], axis: .vertical, spasing: 0)
        let aboutStackView = UIStackView(arrangedSubviews: [aboutLabel, aboutTextField], axis: .vertical, spasing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentControll], axis: .vertical, spasing: 10)
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutStackView, sexStackView, startButton], axis: .vertical, spasing: 40)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeBackLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeBackLabel)
        view.addSubview(imageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeBackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
}

//MARK: - SwiftUI
import SwiftUI

struct SetUpProfileVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = SetUpProfileViewController()
        func makeUIViewController(context: Context) -> SetUpProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
