//
//  Subscriptions.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI
import RealmSwift

struct Subscriptions: View {
    
    let subscriptiions: [Subscription]
    @ObservedResults(Subscription.self) var subscription
    @State var showEditSubscription = false
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(subscription) { subscription in
                ZStack {
                    HStack {
                        if subscription.icon == "" {
                            Image("squirrel")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                .padding(.trailing)
                        } else {
                            Image(subscription.icon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                        VStack(alignment: .leading) {
                            if subscription.descriptions != "" {
                                Text(subscription.title)
                                    .fontWeight(.bold)
                                Text(subscription.descriptions)
                                    .textCase(.uppercase)
                            } else {
                                Text(subscription.title)
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                        HStack {
                            Text(subscription.price)
                                .fontWeight(.bold)
                            Text(subscription.currency)
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                .background(Color(hex: subscription.colorHex))
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
                .contentShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    showEditSubscription.toggle()
                    
                    realmManager.objectId = subscription.id
                    realmManager.notificationId = subscription.notificationId
                    
                    realmManager.selectedSusbscription = subscription
                }
            }
        }
        .sheet(isPresented: $showEditSubscription) {
            EditSubscription()
                .environmentObject(realmManager)
        }
    }
}
