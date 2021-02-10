//
//  Option.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import UIKit

class Option: UICollectionViewCell {
    
    static let reuseIdentifier = "OptionCell"
    
    var imageConteiner = UIImageView()
    var nameRestaurant = UILabel()
    var filterRestaurant = UILabel()
    var price = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageSV = VerticalStackView(arrangedSubviews: [imageConteiner], spacing: 0, alignment: .center)
        
        let namePriceSV = HorizontalStackView(arrangedSubviews: [nameRestaurant,price], spacing: 0, alignment: .center, distribution: .fill)
        
        nameRestaurant.textAlignment = .left
        nameRestaurant.constraintWidth(equalToConstant: bounds.width * 2/3)
        
        price.textAlignment = .right
        
        
        let fullSV = VerticalStackView(arrangedSubviews: [imageSV, namePriceSV, filterRestaurant], spacing: 4, alignment: .fill, distribution: .equalCentering)
        
        imageSV.constraintHeight(equalToConstant: bounds.width * 2/3)
        
        filterRestaurant.font = .systemFont(ofSize: bounds.width * 0.06)
        
        contentView.addSubview(fullSV)
        contentView.backgroundColor = .white
        
        fullSV.backgroundColor = .white
        fullSV.constraintHeight(equalToConstant: bounds.height * 0.95)
        fullSV.constraintWidth(equalToConstant: bounds.width * 0.95)
        fullSV.centerXYin(contentView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFields(_ datas: Restaurant, _ idiom : Language) {
        self.nameRestaurant.text = datas.name
        var typeFood = ""
        var mealTime = ""
        for tpFood in datas.type {
            if idiom == Language.English {
                typeFood.append(tpFood.rawValue)
            } else {
                typeFood.append(tpFood.labelPortuguese)
            }
            if datas.type.index(of: tpFood) != (datas.type.count - 1) {
                typeFood.append(", ")
            }
        }
        for tmMeal in datas.time {
            if idiom == Language.English {
                mealTime.append(tmMeal.rawValue)
            } else {
                mealTime.append(tmMeal.labelPortuguese)
            }
            if datas.time.index(of: tmMeal) != (datas.time.count - 1) {
                mealTime.append(", ")
            }
        }
        self.filterRestaurant.text = "\(typeFood) - \(mealTime)"
        self.filterRestaurant.numberOfLines = 0
        self.price.text = datas.price
        if datas.imageName.isEmpty {
            self.imageConteiner.image = UIImage(systemName: "photo")
        } else {
            self.imageConteiner.image = UIImage(named: datas.imageName)
        }
        
        
    }
    
}

