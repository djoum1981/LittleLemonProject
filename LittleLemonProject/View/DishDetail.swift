//
//  DishDetail.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import SwiftUI

struct DishDetail: View {
    var dish: Dish
   
    
    var body: some View {
        VStack{
            Text(dish.title ?? "no title")
        }
    }
}

struct DishDetail_Previews: PreviewProvider {
    static var previews: some View {
        DishDetail(dish: Dish())
    }
}
