//
//  BobbyFinalApp.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 22.09.2023.
//

import SwiftUI

@main
struct BobbyFinalApp: App {
    
    @ObservedObject var pickersVM = PickersViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(pickersVM)
        }
    }
}
