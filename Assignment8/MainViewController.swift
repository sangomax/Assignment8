//
//  MainViewController.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import UIKit

class MainViewController: UICollectionViewController, HeaderFilterDelegate {
   
    
    lazy var filteredItems: [Restaurant] = Restaurant.items
    
    var optionsMenuSelected: [String] = []
    
    var idiom : Language = .English
    
    var isReload = false
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.register(Option.self, forCellWithReuseIdentifier: Option.reuseIdentifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.headerReuseIdentifier)
        
        collectionView.backgroundColor = UIColor(hexString: "#a72020")
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
        
        let rightBtn = UIBarButtonItem(title: "🇧🇷", style: .plain, target: self, action: #selector(changeIdiom))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationItem.title = "My Restaurant"
        
    }
    
    @objc func changeIdiom() {
        if idiom == Language.English {
            idiom = Language.Portugueses
            self.navigationItem.rightBarButtonItem?.title = "🇨🇦"
            self.navigationItem.title = "Meu Restaurante"
        } else {
            idiom = Language.English
            self.navigationItem.rightBarButtonItem?.title = "🇧🇷"
            self.navigationItem.title = "My Restaurant"
        }
        
        if let header = collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: .init(row: 0, section: 0)) as? Header {
        
            filteredItems = Restaurant.items
            optionsMenuSelected = []
            header.menuFilter.reloadData()
            collectionView.reloadData()
        }
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 5
        // 1. define item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
        
        // 2. define group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        
        // 3. define section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: spacing * 2, trailing: 0)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.interGroupSpacing = spacing
        section.boundarySupplementaryItems = [sectionHeader]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Option.reuseIdentifier, for: indexPath)
            as! Option
        cell.updateFields(filteredItems[indexPath.item], idiom)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = Detail()
        detail.updateFields(filteredItems[indexPath.item], idiom)
        
        navigationController?.pushViewController(detail
                                                 , animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.headerReuseIdentifier, for: indexPath) as! Header
        var optionsFilter = [Menu]()
        for item in MealTime.allCases {
            if idiom == Language.English {
                optionsFilter.append(Menu(label: item.rawValue, code: item.rawValue))
            } else {
                optionsFilter.append(Menu(label: item.labelPortuguese, code: item.rawValue))
            }
        }
        for item in TypeFood.allCases {
            if idiom == Language.English {
                optionsFilter.append(Menu(label: item.rawValue, code: item.rawValue))
            } else {
                optionsFilter.append(Menu(label: item.labelPortuguese, code: item.rawValue))
            }
        }
        header.itemsFilter = optionsFilter.sorted()
        header.delegate = self
        return header
    }
    
    func addFilter(_ filter: String) {
        optionsMenuSelected.append(filter)
        updateFilteredItems()
    }
    
    func removeFilter(_ filter: String) {
        optionsMenuSelected.remove(at: optionsMenuSelected.firstIndex(of: filter)!)
        updateFilteredItems()
    }
    
    func updateFilteredItems(){
        filteredItems.removeAll()
        for filter in optionsMenuSelected {
            for item in Restaurant.items {
                if let type = TypeFood(rawValue: filter) {
                    if item.type.contains(type) && !filteredItems.contains(item) {
                        
                        filteredItems.append(item)
                    }
                } else if let time = MealTime(rawValue: filter){
                    if item.time.contains(time) && !filteredItems.contains(item) {
                        filteredItems.append(item)
                    }
                }
            }
        }
        if optionsMenuSelected.isEmpty {
            filteredItems = Restaurant.items
        }
        collectionView.reloadData()
    }
    
}
