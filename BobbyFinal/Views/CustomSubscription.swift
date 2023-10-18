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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 17)
                        
                    }
                    .tint(.gray)
                    Spacer()
                    Text("New Subscription")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Add")
                        .bold()
                        .tint(.gray)
                        .opacity(0.5)
                }
                .padding()
                ScrollView {
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            realmManager.showCustomSubscription = false
        }
    }
}

#Preview {
    CustomSubscription()
}
