//
//  Filter.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import UIKit

class Filter: UICollectionViewCell {
    
    static let reuseIdentifier = "FilterCell"
    
    var option = UILabel()
    
    var filterCode = String()
    
    var isReload = false
    
    override var isSelected: Bool {
            didSet {
                    option.backgroundColor = isSelected ? UIColor(hexString: "#641313") : .white
                    option.textColor = isSelected ? .white : UIColor(hexString: "#641313")
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(option)
        option.textAlignment = .center
        option.backgroundColor = .white
        option.adjustsFontSizeToFitWidth = true
        option.textColor = UIColor(hexString: "#641313")
        
        option.matchParent()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
