//
//  Subscriptions.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct Subscriptions: View {
    
    let subscriptiions: [Subscription]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(subscriptiions) { subscription in
                ZStack {
                    HStack {
                        Image(subscription.icon)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                            .padding(.trailing)
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
            }
        }
    }
}

//#Preview {
//    Subscriptions()
//}
