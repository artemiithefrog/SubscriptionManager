//
//  AllSubscriptions.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 22.09.2023.
//

import RealmSwift
import SwiftUI

struct AllSubscriptions: View {
    
    @ObservedResults(Subscription.self) var subscription
    var realmManager = RealmManager()
    @State private var showAddSubscription = false
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .tint(.gray)
                Spacer()
                HStack {
                    Text("All Subscriptions")
                        .tint(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 14, height: 7)
                        .fontWeight(.medium)
                }
                Spacer()
                Button {
                    showAddSubscription.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .fontWeight(.medium)
                }
                .tint(.gray)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
            if subscription.isEmpty {
                VStack {
                    Spacer()
                    Text("Hi, my name is Bobby 3!")
                        .fontWeight(.medium)
                        .padding(.bottom, -20)
                    Text("Add your first subscription by tapping the + icon at the top.")
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 100)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                Subscriptions(subscriptiions: realmManager.subscriptions)
                    .padding(.top, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAddSubscription) {
            AddSubscription()
                .environmentObject(realmManager)
        }
        .sheet(isPresented: $showSettings) {
            Settings()
        }
    }
}
