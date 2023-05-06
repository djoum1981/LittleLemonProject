//
//  Home.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct Home: View {
    var homeVm = HomeViewModel()
    
    
    var body: some View {
        TabView {
                MenuView(homeViewModel: homeVm)
            .tabItem {
                Label {
                    Text("Menu")
                } icon: {
                    Image(systemName: "list.dash")
                }
            }
            
            
            UserProfile()
                .tabItem {
                    Label {
                        Text("Profile")
                    } icon: {
                        Image(systemName: "square.and.pencil")
                    }
                }
        }
        .toolbarColorScheme(.light, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .task {
            do{
                let dishes = try await homeVm.fetchData()
                if let dishes = dishes{
                    try Dish.deleteAll()
                    try Dish.saveAll(dishes: dishes)
                    try homeVm.loadData({ dishes in
                        homeVm.dishList = dishes
                    })
                    try homeVm.getCategory({ categories in
                        homeVm.categoryList = categories
                    })
                    print(homeVm.categoryList)
                }
            }catch let error{
                print("error happen on task home \(error.localizedDescription)")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
