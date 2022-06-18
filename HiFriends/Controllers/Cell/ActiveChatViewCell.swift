//
//  CollectionViewCell.swift
//  HiFriends
//
//  Created by Anna Nosyk on 16/06/2022.
//

import UIKit

class ActiveChatViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var idCell: String = "ActiveChatViewCell"
    
    let chatImage = UIImageView()
    let chatName = UILabel(title: "Name friend", textColor: .textMainColor(), font: .helvetica20())
    let lastMessage = UILabel(title: "Hello, where are you?", textColor: .textDescriptionColor(), font: .helvetica18())
    let gradient = GradientView(from: .top, to: .bottom, startColor: .startGradientColor(), endColor: .endGradienColor())

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .cellsBackGround()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configure(with value: HiChat) {
        chatImage.image = UIImage(named: value.userImageString)
        chatName.text = value.username
        lastMessage.text = value.lastMessage
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup constraints

extension ActiveChatViewCell {
    
    private func setupConstraints() {
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradient.translatesAutoresizingMaskIntoConstraints = false
        addSubview(chatImage)
        addSubview(chatName)
        addSubview(lastMessage)
        addSubview(gradient)
        chatImage.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            chatImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatImage.heightAnchor.constraint(equalToConstant: 78),
            chatImage.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            chatName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            chatName.leadingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 16),
            chatName.trailingAnchor.constraint(equalTo: gradient.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            lastMessage.leadingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 16),
            lastMessage.trailingAnchor.constraint(equalTo: gradient.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradient.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradient.heightAnchor.constraint(equalToConstant: 78),
            gradient.widthAnchor.constraint(equalToConstant: 10)
        ])
    }

}


//MARK: - SwiftUI
import SwiftUI

struct ActiveChatCellVCProvider : PreviewProvider {
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
