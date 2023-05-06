//
//  Preview_Provider+Extension.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/6/23.
//

import Foundation
import SwiftUI
extension PreviewProvider{

    static func displayDish() -> Dish {
        let dish = Dish(context: Datamanager.shared.context())
        dish.title = "Duriz"
        dish.category = "Food"
        dish.price = 100.0
        dish.itemDescription = "The best food in the worl"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        return dish
    }
}
