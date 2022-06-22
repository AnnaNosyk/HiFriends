//
//  CustomTexfield.swift
//  HiFriends
//
//  Created by Anna Nosyk on 22/06/2022.
//

import UIKit

class CustomTexfield: UITextField, UITextFieldDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeView()
        self.delegate = self
    }
    
    private func customizeView() {
        backgroundColor = .white
        placeholder = "White something..."
        font = .helvetica16()
        clearButtonMode = .whileEditing
        borderStyle = .none
        layer.cornerRadius = 18
        layer.masksToBounds = true
    
        let image = UIImage(systemName: "face.smiling")
        let imageView = UIImageView(image: image)
        leftView = imageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        leftViewMode = .always
        
        let button = UIButton(type: .system)
        let imageButton = UIImage(systemName: "paperplane")
        button.setImage(imageButton, for: .normal)
        rightView = button
        rightView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        rightViewMode = .always
    }

    // from wich space start text write
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    // for spasing left image view
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var cgRect = super.leftViewRect(forBounds: bounds)
        cgRect.origin.x += 12
        return cgRect
    }
    
    
    // for spasing right button view
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var cgRect = super.rightViewRect(forBounds: bounds)
        cgRect.origin.x -= 12
        return cgRect
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - SwiftUI
import SwiftUI

struct TextFieldProvider : PreviewProvider {
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
