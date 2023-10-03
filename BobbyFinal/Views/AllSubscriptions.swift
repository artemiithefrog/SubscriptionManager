//
//  AllSubscriptions.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 22.09.2023.
//

import SwiftUI

struct AllSubscriptions: View {

    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                if realmManager.subscriptions.isEmpty {
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //                        settings
                    } label: {
                        Image(systemName: "gear")
                    }
                    .tint(.gray)
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("All Subscriptions")
                                .tint(.black)
                                .fontWeight(.bold)
                        }
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 14, height: 7)
                            .fontWeight(.medium)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        realmManager.showAddSubscription.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .fontWeight(.medium)
                    }
                    .tint(.gray)
                }
            }
            .sheet(isPresented: $realmManager.showAddSubscription) {
                AddSubscription()
                    .environmentObject(realmManager)
            }

        }
    }
}

#Preview {
    AllSubscriptions()
}
