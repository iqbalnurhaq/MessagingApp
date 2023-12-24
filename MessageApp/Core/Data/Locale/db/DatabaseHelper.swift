//
//  DatabaseHelper.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 16/12/23.
//

import Foundation
import CoreData

class DatabaseHelper {
    
//    static let shared = DatabaseHelper()
    
    let backgroundcontext: NSManagedObjectContext
    let mainContext: NSManagedObjectContext
    
    init(
        mainContext: NSManagedObjectContext = CoreDataStack.shared.mainContext,
        backgroundContext: NSManagedObjectContext = CoreDataStack.shared.backgroundContext
    ) {
            self.mainContext = mainContext
            self.backgroundcontext = backgroundContext
    }
    
    
    func insertWatchlist(movie: WatchlistEntity, completion: @escaping() -> Void) {
        backgroundcontext.performAndWait {
            do {
                try mainContext.save()
                saveChanges()
                completion()
            } catch {
                print("Error insert into database")
            }
        }
    }
    
    func getAllWatchlist() -> [WatchlistEntity] {
        var watchlist = [WatchlistEntity]()
        let fetchRequest = NSFetchRequest<WatchlistEntity>(entityName: "WatchlistEntity")
        backgroundcontext.performAndWait {
            do {
                watchlist = try mainContext.fetch(fetchRequest)
            }catch {
                print("Error fetch")
            }
        }
        
        return watchlist
    }
    
    
    func getWatchlist(watchlistId: Int) -> WatchlistEntity? {
        var watchlist = [WatchlistEntity]()
        let fetchRequest = NSFetchRequest<WatchlistEntity>(entityName: "WatchlistEntity")
        fetchRequest.predicate = NSPredicate(format: "watchlistId == \(watchlistId)")
        fetchRequest.returnsObjectsAsFaults = false
        backgroundcontext.performAndWait {
            do {
                watchlist = try mainContext.fetch(fetchRequest)
            }catch {
                print("Error fetch")
            }
        }
        return watchlist.first
    }
    
    private func saveMainContext() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
                print("main context")
            } catch {
                print("Error saving main managed object context: \(error)")
            }
        }
    }
    
    private func savePrivateContext() {
        if backgroundcontext.hasChanges {
            do {
                try backgroundcontext.save()
            } catch {
                print("Error saving private managed object context: \(error)")
            }
        }
    }
    
    
    private func saveChanges() {
        savePrivateContext()
        mainContext.performAndWait {
            saveMainContext()
        }
    }
        
//
//    func saveChanges() {
//        self.mainContext.performAndWait {
//            if self.mainContext.hasChanges {
//                do {
//                    try self.mainContext.save()
//                } catch {
//                    print("Error saving main managed object context: \(error)")
//                }
//            }
//        }
//    }
    
    
    
    func saveData<T: NSManagedObject>(objects: [T])  {
        self.backgroundcontext.performAndWait {
            for object in objects {
                self.backgroundcontext.insert(object)
            }
            self.saveChanges()
        }
    }
}
