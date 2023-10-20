//
//  CusctomSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 16.10.2023.
//

import SwiftUI

struct CustomSubscription: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var pickersVM: PickersViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("")
            }
            ScrollView {
              
            }
        }
        .onDisappear {
            realmManager.showCustomSubscription = false
        }
    }
}

#Preview {
    CustomSubscription()
}
