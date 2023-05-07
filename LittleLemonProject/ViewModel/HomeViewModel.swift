//
//  HomeViewModel.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import Foundation
class HomeViewModel: ObservableObject{
    @Published var dishList: [Dish] = []
    @Published var category: String? = nil
    @Published var categoryList: [String] = []
    @Published var searchText: String = ""
    
    func fetchData()async throws -> [MenuItem]?{
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        var dishMenu: [MenuItem]? = nil
        if let url = url{
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let dishes = try JSONDecoder().decode(MenuList.self, from: data)
            dishMenu = dishes.menu
        }
        return dishMenu
    }
    
    func  loadData(_ list: ([Dish]) -> Void) throws{
        let dishData = try Dish.query(by: category)
        list(dishData)
    }
    
    func  search(_ list: ([Dish]) -> Void) throws{
        let dishData = try Dish.query(by: searchText)
        if let dishData = dishData{
            list(dishData)
        }
    }
    
    func getCategory(_ categories: ([String])->Void)throws {
        var dishCategory: [String] = []
        let dishData = try Dish.query()
        var set = Set<String>()
        let dishes = dishData.filter{(set.insert($0.category ?? "no category").inserted)}
        dishes.forEach { dish in
            dishCategory.append(dish.category?.capitalized ?? "No Category")
        }
        dishCategory.append("Sides")
       categories(dishCategory)
    }
}
