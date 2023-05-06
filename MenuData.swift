//
//  MenuData.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/6/23.
//

import Foundation
struct MenuList: Codable {
    let menu: [MenuItem]
}

// MARK: - Menu
struct MenuItem: Codable {
    let id: Int
    let title, description, price: String
    let image: String
    let category: String
}

