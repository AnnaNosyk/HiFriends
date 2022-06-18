//
//  PeoleViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 13/06/2022.
//

import UIKit

class PeoleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainColor()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
}

extension PeoleViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("hhhhhh ")
    }
}
//MARK: - SwiftUI
import SwiftUI

struct PeopleVCProvider : PreviewProvider {
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
