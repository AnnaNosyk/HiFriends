//
//  UserViewCell.swift
//  HiFriends
//
//  Created by Anna Nosyk on 21/06/2022.
//

import UIKit

class UserViewCell: UICollectionViewCell, ConfiguringCell {
   
    static var idCell: String = "UserViewCell"
    
    let userImage = UIImageView()
    let userName = UILabel(title: "Name friend", textColor: .textMainColor(), font: .helvetica20())
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .cellsBackGround()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.textDescriptionColor().cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    // for radius if cwll has shadow
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 10
        self.containerView.clipsToBounds = true
    }
    func configure<U>(with value: U) where U : Hashable {
        guard let user: Users = value as? Users else {return}
        userImage.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
    
    private func setupConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(userImage)
        containerView.addSubview(userName)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userImage.heightAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            userName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - SwiftUI
import SwiftUI

struct UserChatCellVCProvider : PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    struct ContainerView : UIViewControllerRepresentable {
        
        let viewController = MainTabBar()
        func makeUIViewController(context: Context) -> MainTabBar {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
