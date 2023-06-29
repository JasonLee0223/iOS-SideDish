//
//  HomeViewController.swift
//  SideDish
//
//  Created by Jason on 2023/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeCollectionViewDataSource = HomeCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOfUIComponents()
        configureOfSuperViewLayout()
        let isCompleted = homeCollectionViewDataSource.homeViewModel.fetchOfData()
        reload(by: isCompleted)
    }
    
    //MARK: - Private Property
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewLayout()
    )
}

//MARK: - [Public] View Reload Method
extension HomeViewController {
    
    private func reload(by fetched: Bool) {
        
        if fetched {
            let observableData = homeCollectionViewDataSource.homeViewModel.sectionStorage[.main]

            observableData?.bind(listener: { _ in
                Task {
                    self.collectionView.reloadData()
                    self.setHeaderViewDelegate()
                }
            })
        }
    }
    
}

//MARK: - Configure of UI Components
extension HomeViewController {
    
    private func configureOfUIComponents() {
        configureOfSuperView()
        configureOfNavigationBar()
        configureOfCollectionView()
        updateDataSource()
    }
    
    private func configureOfSuperView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureOfNavigationBar() {
        navigationItem.title = "Ordering"
    }
    
    private func configureOfCollectionView() {
        
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        collectionView.collectionViewLayout = configreOfCollectionViewFlowLayout()
        
        collectionView.register(
            HomeHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeHeaderView.identifier
        )
        
        collectionView.register(
            HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.identifier
        )
    }
    
    private func updateDataSource() {
        Task(priority: .high) {
            collectionView.dataSource = homeCollectionViewDataSource
            collectionView.delegate = self
        }
    }
}
        
//MARK: - Configure of Layout
extension HomeViewController {
    
    private func configureOfSuperViewLayout() {
        let superViewSafeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: superViewSafeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superViewSafeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: superViewSafeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: superViewSafeArea.trailingAnchor)
        ])
    }
    
    private func configreOfCollectionViewFlowLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let headerSize = CGSize(width: self.view.frame.width, height: 130)
        let itemSize = CGSize(width:self.view.frame.width, height: 130)
        layout.headerReferenceSize = headerSize
        layout.itemSize = itemSize
        return layout
    }
}

//MARK: - Configure of HeaderDelegate
extension HomeViewController: HeaderDelegate {
    
    func didTapSectionHeader(section: HomeHeaderView, sectionNumber: Int) {
        section.itemsCount = collectionView.numberOfItems(inSection: sectionNumber)
    }
    
    private func setHeaderViewDelegate() {
        Task { [weak self] in
            guard let self = self else { return }
            let countOfSection = collectionView.numberOfSections

            for sectionIndex in 0..<countOfSection {
                guard let sectionHeaderView = self.collectionView.supplementaryView(
                    forElementKind: UICollectionView.elementKindSectionHeader,
                    at: IndexPath(row: 0, section: sectionIndex)
                ) as? HomeHeaderView else { return }
                sectionHeaderView.headerDelegate = self
            }
        }
    }
    
}

//MARK: - Configure of CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let sectionType = Section(rawValue: indexPath.section) else {
            return
        }
        
        guard let bindModels = homeCollectionViewDataSource.homeViewModel.sectionStorage[sectionType]?.value else {
            return
        }
        
        let selectedFood = bindModels[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.detailFoodCode = selectedFood.foodCode
        detailViewController.badges = selectedFood.badge
        detailViewController.foodTitle = selectedFood.foodInformation.foodName
        
        navigationController?.pushViewController(detailViewController, animated: true)
        navigationController?.navigationBar.topItem?.title = "뒤로"
    }
}
