//
//  UIViewController+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 21/06/2022.
//

import UIKit

extension UIViewController {
    func configure<T: ConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.idCell, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
    
    func showAlert(with title: String, and message: String, complition: @escaping()->Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            complition()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}
