//
//  MenuItem+Extension.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import Foundation
import CoreData
extension Dish{
    
    static var context: NSManagedObjectContext{
        Datamanager.shared.persitentContainer.viewContext
    }
    
    static func deleteAll() throws{
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        try context.persistentStoreCoordinator?.execute(deleteRequest, with: context)
    }
    
    
    static func query(by category: String? = nil)throws->[Dish]{
        let request: NSFetchRequest<Dish> = Dish.fetchRequest()
        let sortDescriptor = NSSortDescriptor(keyPath: \Dish.title, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        if let category = category{
            let categoryPredicate = NSPredicate(format: "category == %@", category)
            request.predicate = categoryPredicate
        }
        
        return try context.fetch(request) as [Dish]
    }
    
    static func query(by name: String)throws->[Dish]?{
        let request: NSFetchRequest<Dish> = Dish.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[CD] %@", name)
        request.predicate = predicate
        return try context.fetch(request)
    }
    
    static func saveAll(dishes: [MenuItem])throws{
        for aDish in dishes {
            if (try !isDishExist(title: aDish.title)){
                let dish = Dish(context: context)
                dish.title = aDish.title
                dish.category = aDish.category
                dish.id = Int16(aDish.id)
                dish.itemDescription = aDish.description
                dish.image = aDish.image
                dish.price = Double(aDish.price) ?? 0
                
                try context.save()
            }
        }
    }
    
    private static func isDishExist(title: String)throws->Bool{
        let request: NSFetchRequest<Dish> = Dish.fetchRequest()
        let predicate = NSPredicate(format: "title == %@", title)
        request.predicate = predicate
        let dishes = try context.fetch(request)
        return dishes.count > 0
    }
}
