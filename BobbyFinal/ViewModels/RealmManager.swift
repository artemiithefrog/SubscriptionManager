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
    @Published var selectedSusbscription: Subscription = Subscription()
    
    @Published var title = ""
    @Published var descriptions = ""
    @Published var icon = ""
    @Published var currency = "$"
    @Published var price = ""
    @Published var color: Color = .orange
    @Published var notificationId = ""
    @Published var colorHex = ""
    
    @Published var firstBillDate = Date()

    @Published var selectedDate = 31
    @Published var selectedDay = ""
    @Published var selectedTime = ""

    @Published var date = 0
    @Published var day = 0

    @Published var selectedCycle = "Every"
    @Published var selectedCyclePeriod = 1
    @Published var selectedCycleDate = "Month(s)"
    
    @Published var objectId = ObjectId()
    
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
                                                               "colorHex" : color.toHexString(),
                                                               "firstBillDate" : firstBillDate,
                                                               "selectedDate" : selectedDate,
                                                               "selectedDay" : selectedDay,
                                                               "selectedTime" : selectedTime,
                                                               "date" : date,
                                                               "day" : day,
                                                               "selectedCycle" : selectedCycle,
                                                               "selectedCyclePeriod" : selectedCyclePeriod,
                                                               "selectedCycleDate" : selectedCycleDate])
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
                try localRealm.write {
                    let updatedSubsciption = localRealm.create(Subscription.self, value: ["id" : id,
                                                                                          "title" : self.title,
                                                                                          "descriptions" : self.descriptions,
                                                                                          "currency" : self.currency,
                                                                                          "price" : self.price,
                                                                                          "firstBillDate" : self.firstBillDate,
                                                                                          "selectedDate" : self.selectedDate,
                                                                                          "selectedDay" : self.selectedDay,
                                                                                          "selectedTime" : self.selectedTime,
                                                                                          "date" : self.date,
                                                                                          "day" : self.day,
                                                                                          "selectedCycle" : self.selectedCycle,
                                                                                          "selectedCyclePeriod" : self.selectedCyclePeriod,
                                                                                          "selectedCycleDate" : self.selectedCycleDate], update: .modified)
                    getTasks()
                    print("Added new task to Realm: \(updatedSubsciption)")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                if let subscriptionToDelete = localRealm.object(ofType: Subscription.self, forPrimaryKey: id) {
                    try localRealm.write {
                        // Удаление категории
                        localRealm.delete(subscriptionToDelete)
                    }
                    getTasks()
                }
            } catch {
                print("Error deleting category: \(error)")
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
        
        firstBillDate = Date()
        selectedDate = 31
        selectedDay = ""
        selectedTime = ""
        date = 0
        day = 0
        selectedCycle = "Every"
        selectedCyclePeriod = 1
        selectedCycleDate = "Month(s)"
    }
}
