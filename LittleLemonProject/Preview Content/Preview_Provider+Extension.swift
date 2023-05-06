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
        dish.itemDescription = "The best food in the world if you ever try this dish you surely will want to try more of it, because it is one of teh be thing that would "
        dish.image = "Grilled Fish"
        return dish
    }
}
