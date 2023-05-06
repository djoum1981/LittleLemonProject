//
//  MenuData.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import Foundation

struct MenuDishes: Codable {
    let menu: [DishMenu]
}


struct DishMenu: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
