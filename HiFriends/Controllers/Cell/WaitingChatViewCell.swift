//
//  WaitingChatViewCell.swift
//  HiFriends
//
//  Created by Anna Nosyk on 17/06/2022.
//

import UIKit

class WaitingChatViewCell: UICollectionViewCell, ConfiguringCell {
    
    
    
    
    static var idCell: String = "WaitingChatViewCell"
    
    let chatImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cellsBackGround()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        setupConstraints()
    }
    
    func configure(with value: HiChat) {
        chatImage.image = UIImage(named: value.userImageString)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup constraints

extension WaitingChatViewCell {
    
    private func setupConstraints() {
        
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(chatImage)
        NSLayoutConstraint.activate([
            chatImage.topAnchor.constraint(equalTo: self.topAnchor),
            chatImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            chatImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct WaitingChatCellVCProvider : PreviewProvider {
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
