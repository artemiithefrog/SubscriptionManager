//
//  ContentView.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        AllSubscriptions()
    }
}

#Preview {
    ContentView()
}
