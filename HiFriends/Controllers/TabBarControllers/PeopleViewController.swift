//
//  PeoleViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 13/06/2022.
//

import UIKit
import FirebaseAuth

class PeopleViewController: UIViewController {
    //demo users
   // let users = Bundle.main.decode([HiUsers].self, from: "users.json")
    let users = [HiUsers]()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, HiUsers>!
    
    // for sections in collectionView
    enum Section: Int, CaseIterable {
    case  users
        func description(usersCount: Int)-> String {
            switch self {
            case .users:
                return "\(usersCount) online"
            }
        }
    }
    
    private let currentUser: HiUsers
    
    init(currentUser: HiUsers) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
        title = currentUser.username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupCollectionView()
        setupDataSource()
        reloadData(with: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOut))
        
    }
    
    @objc private func logOut() {
        let alert = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            do {
                try Auth.auth().signOut()
                UIApplication.shared.keyWindow?.rootViewController = AuthViewController()
            } catch {
                print("Error sign out - \(error.localizedDescription)")
            }
        }))
        present(alert, animated: true, completion: nil)
        
        
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
    
    // create collectionView
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCell())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainColor()
        view.addSubview(collectionView)
        //for headers
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(UserViewCell.self, forCellWithReuseIdentifier: UserViewCell.idCell)
    }
    
    // data for items
    private func reloadData(with searchText: String?) {
        let filtered = users.filter { user in
            user.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, HiUsers>()
        snapshot.appendSections([.users])
        snapshot.appendItems( filtered, toSection: .users)
       
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
}
//MARK: - Data Source
extension PeopleViewController {
    // dataSource for cells
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, HiUsers>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            switch section {
     
            case .users:
                return self.configure(collectionView: collectionView, cellType: UserViewCell.self, with: user, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, IndexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: IndexPath) as? SectionHeader else {fatalError("Can't create new section")}

            guard let section = Section(rawValue: IndexPath.section) else {fatalError("Unknown section")}
            //how many items
            let items = self.dataSource.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.configure(text: section.description(usersCount: items.count),
                                    font: .helvetica20()!,
                                    textColr:.textDescriptionColor())
                    return sectionHeader
        }
    }
}


// MARK: - Setup Layout

extension PeopleViewController {
    // create cells with UICollectionViewCompositionalLayout
    private func createCell()-> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section")
            }
            switch section {
            
            case .users:
                return self.setupUserCell()
            }
           
        }
        // for spacing between sections
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 16
        layout.configuration = configuration
        return layout
    }
    
    
    //CompositionalLayout for active chats
    
    private func setupUserCell() -> NSCollectionLayoutSection {
        let spasing = CGFloat(15)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        // spasing for items
        group.interItemSpacing = .fixed(spasing)
        let section = NSCollectionLayoutSection(group: group)
        //spasing for group
        section.interGroupSpacing = spasing
        // for spasing for section
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 15, bottom: 0, trailing: 15)
        
        let sectionHeader = setupSectionHeader()
       section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func setupSectionHeader()-> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        return sectionHeader
    }

    
    
    
}

extension PeopleViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
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
