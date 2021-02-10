//
//  ViewController.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import UIKit

class Detail: UIViewController {
    
    var imageConteiner = UIImageView()
    var nameRestaurant = UILabel()
    var type = UILabel()
    var time = UILabel()
    var price = UILabel()
    var descRestaurant = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let middleSV = HorizontalStackView(arrangedSubviews: [type,price], spacing: 10)
        
        
        view.addSubview(nameRestaurant)
        view.addSubview(imageConteiner)
        view.addSubview(price)
        view.addSubview(type)
        view.addSubview(time)
        view.addSubview(descRestaurant)
        
        nameRestaurant.translatesAutoresizingMaskIntoConstraints = false
        nameRestaurant.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        nameRestaurant.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        nameRestaurant.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        nameRestaurant.textAlignment = .center
        nameRestaurant.font = .boldSystemFont(ofSize: view.bounds.width * 0.07)
        nameRestaurant.textColor = UIColor(hexString: "#641313")

        imageConteiner.translatesAutoresizingMaskIntoConstraints = false
        imageConteiner.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        imageConteiner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        imageConteiner.topAnchor.constraint(equalTo: nameRestaurant.bottomAnchor, constant: 0).isActive = true
        imageConteiner.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        price.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        price.topAnchor.constraint(equalTo: imageConteiner.bottomAnchor, constant: 0).isActive = true
        price.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.bounds.width * 0.05)).isActive = true
        price.textAlignment = .right
        price.font = .systemFont(ofSize: view.bounds.width * 0.05)
        price.textColor = UIColor(hexString: "#641313")

        type.translatesAutoresizingMaskIntoConstraints = false
        type.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        type.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        type.topAnchor.constraint(equalTo: imageConteiner.bottomAnchor, constant: 0).isActive = true
        type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.05).isActive = true
        type.textAlignment = .left
        type.font = .systemFont(ofSize: view.bounds.width * 0.05)
        type.textColor = UIColor(hexString: "#641313")
        
        time.translatesAutoresizingMaskIntoConstraints = false
        time.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        time.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        time.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 0).isActive = true
        time.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.05).isActive = true
        time.textAlignment = .left
        time.font = .systemFont(ofSize: view.bounds.width * 0.05)
        time.textColor = UIColor(hexString: "#641313")
        
        descRestaurant.translatesAutoresizingMaskIntoConstraints = false
        descRestaurant.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        descRestaurant.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        descRestaurant.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 20).isActive = true
        descRestaurant.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.05).isActive = true
//        descRestaurant.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.bounds.width * 0.05)).isActive = true
        descRestaurant.textAlignment = .justified
        descRestaurant.font = .systemFont(ofSize: view.bounds.width * 0.04)
        descRestaurant.numberOfLines = 0
        descRestaurant.lineBreakMode = .byWordWrapping
        descRestaurant.textColor = UIColor(hexString: "#641313")
        
    }
    
    
    func updateFields(_ datas: Restaurant, _ idiom : Language) {
       
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
        
        self.nameRestaurant.text = datas.name
        self.type.text = typeFood
        self.time.text = mealTime
        self.price.text = datas.price
        if datas.imageName.isEmpty {
            self.imageConteiner.image = UIImage(systemName: "photo")
        } else {
            self.imageConteiner.image = UIImage(named: datas.imageName)
        }
        if idiom == Language.English {
            self.descRestaurant.text = datas.desc.rawValue
        } else {
            self.descRestaurant.text = datas.desc.descPortuguese
        }
        
    }
    

}
