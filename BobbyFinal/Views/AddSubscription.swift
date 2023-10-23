//
//  AddSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 22.09.2023.
//

import SwiftUI

struct AddSubscription: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 18, height: 10.5)
                        .padding()
                }
                .tint(.gray)
                Spacer()
                Text("Add Subscription")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Spacer()
                Button {
                } label: {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                        .padding()
                }
                .tint(.gray)
            }
            
            AddSubscriptionSegmentedControl()
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        VStack {
                            GeometryReader { geometry in
                                Button {
                                    realmManager.showCustomSubscription = true
                                } label: {
                                    Text("Create custom subscription")
                                }
                                .tint(.white)
                                .frame(width: geometry.size.width, height: 35)
                                .background(Color.gray)
                                .cornerRadius(5)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
                .navigationDestination(isPresented: $realmManager.showCustomSubscription) {
//                    CustomSubscription()
//                        .environmentObject(realmManager)
                }

        }
    }
}
