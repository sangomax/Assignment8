//
//  Restaurant.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import Foundation

struct Restaurant : Hashable {
    
    var type : [TypeFood]
    var time : [MealTime]
    var price : String
    var name : String
    var imageName: String
    var desc: descRestaurant
    
    static let items : [Restaurant] =
        [Restaurant(type: [.Brazilian,.BBQ], time: [.Dinner],price: "$$$" , name: "Rio Brazilian Steakhouse", imageName: "RioBrazilianSteakhouse", desc: descRestaurant.RioBrazilianSteakhouse),
         Restaurant(type: [.Italian], time: [.Lunch,.Dinner],price: "$" , name: "The Old Spaghetti Factory", imageName: "TheOldSpaghettiFactory",desc: descRestaurant.TheOldSpaghettiFactory),
         Restaurant(type: [.FastFood, .American], time: [.Lunch,.Dinner],price: "$", name: "Five Guys", imageName: "FiveGuys", desc: descRestaurant.FiveGuys),
         Restaurant(type: [.American], time: [.Lunch,.Dinner],price: "$$", name: "Red Robin", imageName: "RedRobin", desc: descRestaurant.RedRobin),
         Restaurant(type: [.Japanese], time: [.Lunch,.Dinner],price: "$", name: "Ramen Gojiro", imageName: "RamenGojiro", desc: descRestaurant.RamenGojiro),
         Restaurant(type: [.Mediterranean], time: [.Breakfast,.Lunch],price: "$$", name: "Café Medina", imageName: "CafeMedina", desc: descRestaurant.CafeMedina),
         Restaurant(type: [.OldSchool], time: [.Breakfast], price: "$", name: "The Templeton", imageName: "TheTempleton", desc: descRestaurant.TheTempleton),
         Restaurant(type: [.Mexican], time: [.Lunch,.Dinner],price: "$", name: "Chipotle", imageName: "Chipotle", desc: descRestaurant.Chipotle),
         Restaurant(type: [.Japanese,.BBQ], time: [.Lunch,.Dinner],price: "$$", name: "Gyu-Kaku", imageName: "GyuKaku", desc: descRestaurant.GyuKaku),
         Restaurant(type: [.Mexican], time: [.Lunch,.Dinner],price: "$", name: "La Cantina Tacos", imageName: "LaCantinaTacos", desc: descRestaurant.LaCantinaTacos)]
    
}
