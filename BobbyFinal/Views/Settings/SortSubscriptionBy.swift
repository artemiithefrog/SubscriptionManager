//
//  SortSubscriptionBy.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 02.11.2023.
//

import SwiftUI

struct SortSubscriptionBy: View {
    
    @Environment(\.dismiss) var dismiss
    
    var subscriptionSort = ["Latest", "Alphabetical (A - Z)", "Alphabetical (Z - A)", "Color", "Payment Date", "Price (High - Low)", "Price (Low -High)", "None"]
    @State private var selectedSort = "None"
    
    var body: some View {
        NavigationStack {
            HStack {
                ZStack {
                    Text("Subscription Sort Order")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 10, height: 17)
                        }.tint(.gray)
                        Spacer()
                    }
                }
            }
            .padding()
            
            ScrollView {
                ForEach(subscriptionSort, id: \.self) { order in
                    VStack {
                        Divider()
                        HStack {
                            Text(order)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        Divider()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SortSubscriptionBy()
}
