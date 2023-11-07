//
//  ViewTotalAs.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 02.11.2023.
//

import SwiftUI

struct ViewTotalAs: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var averageExpensesSelected = true
    @State private var remainingExpensesSelected = false
    @State private var totalExpensesSelected = false
    
    var body: some View {
        NavigationStack {
            HStack {
                ZStack {
                    Text("View Total as")
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
                Divider()
                HStack {
                    Image(systemName: "checkmark")
                        .opacity(averageExpensesSelected ? 1 : 0)
                        .foregroundColor(.orange)
                        .padding(.leading)
                    VStack {
                        Text("Average Expenses")
                        Text("Divides the total of all bills into the period of your choosing.")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .onTapGesture {
                    averageExpensesSelected = true
                    remainingExpensesSelected = false
                    totalExpensesSelected = false
                }
                Divider()
                HStack {
                    Image(systemName: "checkmark")
                        .opacity(remainingExpensesSelected ? 1 : 0)
                        .foregroundColor(.orange)
                    VStack {
                        Text("Remaining Expenses")
                        Text("Shows a total of the bills you have left to pay in this period.")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .onTapGesture {
                    averageExpensesSelected = false
                    remainingExpensesSelected = true
                    totalExpensesSelected = false
                }
                Divider()
                HStack {
                    Image(systemName: "checkmark")
                        .opacity(totalExpensesSelected ? 1 : 0)
                        .foregroundColor(.orange)
                    VStack {
                        Text("Total Expenses")
                        Text("Shows a total of the bills you have in this entire period.")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .onTapGesture {
                    averageExpensesSelected = false
                    remainingExpensesSelected = false
                    totalExpensesSelected = true
                }
                Divider()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ViewTotalAs()
}
