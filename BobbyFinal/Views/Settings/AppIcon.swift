//
//  AppIcon.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 08.11.2023.
//

import SwiftUI

struct AppIcon: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            HStack {
                ZStack {
                    Text("App Icon")
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
            VStack {
                Text("Customize your App icon")
                    .fontWeight(.medium)
                Text("Choose the app icon for your homescreen.")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(.top, 1)
                Spacer()
            }.padding(.top)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AppIcon()
}
