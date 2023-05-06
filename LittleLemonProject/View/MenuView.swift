//
//  Menu.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct MenuView: View {
    @State var search: String = ""
    @ObservedObject var homeViewModel: HomeViewModel
    @State var isdishSelected: Bool = false
    @State var SelectedDish: Dish?
    
    
    var body: some View {
        VStack{
            Header()
    
            VStack(alignment: .leading)  {
                Text("Little Lemon")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Chicago")
                            .foregroundColor(Color.theme.customPrimary2)
                            .font(.title)
                        
                        Text("we are a familly owned mediterenean restaurant, focused on traditional recipes served with a moderntwist")
                            .lineSpacing(10)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .padding(.trailing)
                            .foregroundColor(Color.white)
                    }
                    Image("Hero image")
                        .resizable()
                        .frame(width: 130, height: 160)
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.theme.customPrimary1)
            
            VStack(spacing: 12){
                HStack {
                    Text("Order for delivery")
                        .font(.title)
                    Spacer()
                }
               
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(homeViewModel.categoryList, id: \.self) { category in
                                Button {
                                    homeViewModel.category = category.lowercased()
                                    do{
                                        try homeViewModel.loadData { list in
                                            homeViewModel.dishList = list
                                        }
                                    }catch{
                                        print("Could not filter")
                                    }
                                } label: {
                                    Text(category)
                                        .foregroundColor(Color.primary)
                                        .padding(8)
                                }
                                .buttonStyle(.bordered)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            ScrollView{
                ForEach(homeViewModel.dishList, id: \.id) { dish in
                    NavigationLink {
                        DishDetail(dish: dish)
                    } label: {
                        MenuCell(dishItem: dish)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.theme.customSecondary5)
                
        }
        .onAppear {
            homeViewModel.category = nil
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(homeViewModel: HomeViewModel())
    }
}


