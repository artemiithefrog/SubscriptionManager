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

}
