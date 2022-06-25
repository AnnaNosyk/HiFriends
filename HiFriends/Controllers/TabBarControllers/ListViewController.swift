//
//  ListViewController.swift
//  HiFriends
//
//  Created by Anna Nosyk on 13/06/2022.
//

import UIKit

class ListViewController: UIViewController {
    
    // demo list
    let activeChats = Bundle.main.decode([HiChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([HiChat].self, from: "waitingChats.json")
    
    var collectionView: UICollectionView!
    
    // for different sections in collectionView
    enum Section: Int, CaseIterable {
    case  waitingChats , activeChats
        func description()-> String {
            switch self {
                
            case .waitingChats:
                return "Waiting chats"
            case .activeChats:
                return "Active chats"
            }
        }
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, HiChat>?
    
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
        setupCollectionView()
        setupSearchBar()
        setupDataSource()
        reloadData()
    }
    
    // create searchBar
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
        collectionView.register(ActiveChatViewCell.self, forCellWithReuseIdentifier: ActiveChatViewCell.idCell)
        collectionView.register(WaitingChatViewCell.self, forCellWithReuseIdentifier: WaitingChatViewCell.idCell)
    }
    
    // data for items
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, HiChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
        
    }

}

//MARK: - Data Source

extension ListViewController {
    // dataSource for cells
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, HiChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            
            switch section {
                
            case .activeChats:
                return self.configure(collectionView: collectionView, cellType: ActiveChatViewCell.self, with: chat, for: indexPath)
            case .waitingChats:
                return self.configure(collectionView: collectionView, cellType: WaitingChatViewCell.self, with: chat, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, IndexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: IndexPath) as? SectionHeader else {fatalError("Can't create new section")}
            
            guard let section = Section(rawValue: IndexPath.section) else {fatalError("Unknown section")}
            sectionHeader.configure(text: section.description(),
                                    font: .helvetica20()!,
                                    textColr:.textDescriptionColor())
                    return sectionHeader
        }
    }
}

// MARK: - Seup Layout

extension ListViewController {
    // create cells with UICollectionViewCompositionalLayout
    private func createCell()-> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section")
            }
            switch section {
            case .activeChats:
                return self.setupActiveChatsCell()
            case .waitingChats:
                return self.setupWaitingChatsCell()
            }
        }
        // for spacing between sections
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 16
        layout.configuration = configuration
        return layout
    }
    
    //CompositionalLayout for active chats
    
    private func setupActiveChatsCell() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        //spasing for group
        section.interGroupSpacing = 8
        // for spasing for section
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        let sectionHeader = setupSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    //CompositionalLayout for waiting chats
    private func setupWaitingChatsCell() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section =  NSCollectionLayoutSection(group: group)
        //spasing for group
        section.interGroupSpacing = 16
        // for spasing for section
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        // for scroling
        section.orthogonalScrollingBehavior = .continuous
        
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


// MARK: - UISearchBarDelegate
extension ListViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("hhhhhh ")
    }
}



//MARK: - SwiftUI
import SwiftUI

struct ListVCProvider : PreviewProvider {
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
