//
//  MainTabBar.swift
//  HiFriends
//
//  Created by Anna Nosyk on 13/06/2022.
//

import UIKit

class MainTabBar: UITabBarController {
    
    
    private let currentUser: HiUsers
    
    init(currentUser: HiUsers = HiUsers(username: "frfer",
                                    email: "fr",
                                    avatarStringURL: "fer",
                                    description: "fre",
                                    sex: "ewr",
                                    id: "fregtr")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listVC = ListViewController(currentUser: currentUser)
        let peoleVc = PeopleViewController(currentUser: currentUser)
        tabBar.tintColor = .backGroundButton()
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImage = UIImage(systemName: "person.3", withConfiguration: boldConfig)!
        let chatImage = UIImage(systemName: "text.bubble", withConfiguration: boldConfig)!
        
        viewControllers = [
            setupNavigationController(rootVC: peoleVc, title: "People", image: peopleImage),
            setupNavigationController(rootVC: listVC, title: "Chats", image: chatImage)
           
        ]

    }
    
    private func setupNavigationController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navVc = UINavigationController(rootViewController: rootVC)
        navVc.tabBarItem.title = title
        navVc.tabBarItem.image = image
        return navVc
    }
  

}
