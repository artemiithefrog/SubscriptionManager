//
//  RealmManager.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI
import RealmSwift

class RealmManager: ObservableObject {
    
    private var localRealm: Realm?
    @Published var subscriptions: [Subscription] = []
    
    @Published var title = ""
    @Published var descriptions = ""
    @Published var icon = ""
    @Published var currency = "$"
    @Published var price = ""
    @Published var color: Color = .orange
    @Published var notificationId = ""
    
    @Published var showAddSubscription = false
    @Published var showNewSubscription = false
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening realm \(error.localizedDescription)")
        }
    }
    
    func addTask() {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newSubscription = Subscription(value: ["title" : title,
                                                               "descriptions" : descriptions,
                                                               "icon" : icon,
                                                               "currency" : currency,
                                                               "price" : price,
                                                               "colorHex" : color.toHexString()])
                    localRealm.add(newSubscription)
                    getTasks()
                    print("Added new task to Realm: \(newSubscription)")
                }
            } catch {
                print("Error adding task to Realm: \(error.localizedDescription)")
            }
        }
        showAddSubscription = false
        showNewSubscription = false
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allSubscriptions = localRealm.objects(Subscription.self)
            subscriptions = []
            allSubscriptions.forEach { subscription in
                subscriptions.append(subscription)
            }
        }
    }
    
    func updateTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let subscriptionToUpdate = localRealm.objects(Subscription.self).filter(NSPredicate(format: "id == %@", id))
                guard !subscriptionToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    getTasks()
                    print("Updated task with id \(id)!")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let subscriptionToDelete = localRealm.objects(Subscription.self).filter(NSPredicate(format: "id == %@", id))
                guard !subscriptionToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(subscriptionToDelete)
                    getTasks()
                    print("Deleted task with id \(id)")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error.localizedDescription)")
            }
        }
    }
    
    func deinitData() {
        
        title = ""
        descriptions = ""
        icon = ""
        currency = "$"
        price = ""
        color = .orange
        notificationId = ""
        
    }
}
