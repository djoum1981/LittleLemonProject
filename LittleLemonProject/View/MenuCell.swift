//
//  MenuItems.swift
//  LittleLemon
//
//  Created by Julien Laurent on 5/1/23.
//

import SwiftUI

struct MenuCell: View {
    var dishItem: Dish
        
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12){
                Text(dishItem.title ?? "No title")
                    .font(.title)
                    .fontWeight(.bold)
                    
                Text(dishItem.itemDescription ?? "No description")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(10)
                
                Text(dishItem.price.currencyAsString)
                    .monospaced()
                    .padding(.top, 8)
            }
            .foregroundColor(.primary)
            .padding(.vertical)
                        
            let imageUrl = URL(string: dishItem.image ?? "No image")
            AsyncImage(url: imageUrl) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
        }
        .padding(.horizontal)
    }
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(dishItem: displayDish())
    }
}
