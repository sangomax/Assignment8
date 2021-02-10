//
//  Header.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import UIKit

protocol HeaderFilterDelegate: class {
    func addFilter(_ filter: String)
    func removeFilter(_ filter: String)
}

class Header: UICollectionReusableView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    static let headerReuseIdentifier = "FilterCell"
    
    var menuFilter : UICollectionView!
    
    var itemsFilter : [Menu] = []
    
    var isReload = false
    
    weak var delegate: HeaderFilterDelegate?
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        let menuFilterWidth = bounds.width - 20

        menuFilter = UICollectionView(frame: .init(x: 10, y: 10, width: menuFilterWidth, height: bounds.height - 10), collectionViewLayout: generateLayout())
        menuFilter.backgroundColor = .clear
        menuFilter.layer.cornerRadius = 10
        menuFilter.dataSource = self
        menuFilter.delegate = self
        menuFilter.register(Filter.self, forCellWithReuseIdentifier: Filter.reuseIdentifier)
        menuFilter.showsVerticalScrollIndicator = true
        menuFilter.allowsMultipleSelection = true
        addSubview(menuFilter)
    }

    
    private func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 5
        // 1. define item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 2. define group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1/2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        
        // 3. define section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: spacing * 2, trailing: 0)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.05))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.interGroupSpacing = spacing
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Filter.reuseIdentifier, for: indexPath) as! Filter
        cell.option.text = itemsFilter[indexPath.row].label
        cell.filterCode = itemsFilter[indexPath.row].code
        cell.isReload = isReload
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = menuFilter.cellForItem(at: indexPath) as! Filter
        updateFilter(selectedCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = menuFilter.cellForItem(at: indexPath) as! Filter
        updateFilter(selectedCell)
    }
    
    func updateFilter(_ cell: Filter){
        if(cell.isSelected) {
            delegate?.addFilter((cell.filterCode))
        } else {
            delegate?.removeFilter((cell.filterCode))
        }
    }
}


struct Menu : Comparable {
   
    var label : String
    var code : String
    
    static func < (lhs: Menu, rhs: Menu) -> Bool {
        return lhs.label < rhs.label
    }
    
}
