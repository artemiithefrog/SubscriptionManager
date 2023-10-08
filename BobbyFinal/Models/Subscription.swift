//
//  Subscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI
import RealmSwift

class Subscription: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var descriptions = ""
    @Persisted var icon = ""
    @Persisted var currency = ""
    @Persisted var price = ""
    @Persisted var colorHex = ""
    @Persisted var notificationId = ""
    
//    pickers
//    first bill date picker
    @Persisted var firstBillDate = Date()
    
//    remind me picker
    @Persisted var selectedDate = 31
    @Persisted var selectedDay = ""
    @Persisted var selectedTime = ""
    
//    duration picker
    @Persisted var date = 0
    @Persisted var day = 0
    
//    cycle picker
    @Persisted var selectedCycle = "Every"
    @Persisted var selectedCyclePeriod = 1
    @Persisted var selectedCycleDate = "Month(s)"

}
