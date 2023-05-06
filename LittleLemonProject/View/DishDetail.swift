//
//  DishDetail.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import SwiftUI

struct DishDetail: View {
    var dish: Dish
    @State var isItemAdded: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
            VStack {
                Image("Logo")
                ScrollView{
                    Image(dish.title ?? "")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 20) {
                        Text(dish.title ?? "No title")
                            .font(.title)
                        
                        Text(dish.price.currencyAsString)
                            .monospaced()
                            .font(.headline)
                        
                        Text(dish.itemDescription ?? "")
                    }
                    .padding(.horizontal)
                }
                Button {
                    isItemAdded.toggle()
                } label: {
                    Text("Add to cart - \(dish.price.currencyAsString)")
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color.theme.customPrimary2)
                        .cornerRadius(8)
                }
                .padding()
                
            }
            
            .alert("Success", isPresented: $isItemAdded) {
                Button {
                    dismiss()
                } label: {
                    Text("Ok")
                }

            } message: {
                Text("\(dish.title ?? "" ) is added successfully to the cart")
            }
    }
}

struct DishDetail_Previews: PreviewProvider {
    static var previews: some View {
        DishDetail(dish: displayDish())
    }
}
