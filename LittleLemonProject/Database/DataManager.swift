//
//  DataManager.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/5/23.
//

import Foundation
import CoreData
struct Datamanager{
    static var shared = Datamanager()
    let  persitentContainer: NSPersistentContainer
    
    private init() {
        self.persitentContainer = NSPersistentContainer(name: "LittleLemonProjectDB")
        self.persitentContainer.loadPersistentStores { desc, error in
            if let error = error{
                fatalError("Unable to load the database \(error.localizedDescription)")
            }
        }
        persitentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func context()-> NSManagedObjectContext {
        return persitentContainer.viewContext
    }
}
