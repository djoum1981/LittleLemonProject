//
//  Menu.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State var SelectedDish: Dish?
    
    var body: some View {
        VStack{
            Header()
            
            VStack(alignment: .leading)  {
                Text("Little Lemon")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.customPrimary2)
                if !homeViewModel.isTapped {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Chicago")
                                .foregroundColor(Color.white)
                                .font(.title)
                            
                            Text("we are a familly owned mediterenean restaurant, focused on traditional recipes served with a moderntwist")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .padding(.trailing)
                                .foregroundColor(Color.white)
                        }
                        Image("Hero image")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    }
                    .opacity(!homeViewModel.isTapped ? 1 : 0)
                }
                
                TextField("Search", text: $homeViewModel.searchText, onEditingChanged: { isChange in
                    withAnimation {
                        homeViewModel.isTapped = isChange
                    }
                })
                .submitLabel(.done)
                .onChange(of: homeViewModel.searchText, perform: { _ in
                    do{
                        if !homeViewModel.searchText.isEmpty{
                            try homeViewModel.search({ dish in
                                homeViewModel.dishList = dish
                            })
                        }else{
                            try homeViewModel.loadData({ dish in
                                homeViewModel.dishList = dish
                            })
                        }
                    }catch{
                        print("issues")
                    }
                })
                .padding()
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(8)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.theme.customPrimary1)
            
            VStack(spacing: 12){
                if !homeViewModel.isTapped {
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
                        .opacity(!homeViewModel.isTapped ? 1 : 0)
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
                        VStack{
                            Divider()
                            MenuCell(dishItem: dish)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            homeViewModel.category = nil
            homeViewModel.searchText = ""
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(homeViewModel: HomeViewModel())
    }
}


