//
//  CustomSubscriptionIcon.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 24.10.2023.
//

import SwiftUI

struct CustomSubscriptionIcon: View {
    
    @State private var selectedIcon = ""
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var icons = ["camera", "envelope", "graduation-cap", "home", "shopping-cart", "video-camera-alt"]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 17, height: 10)
                }
                .tint(.gray)
                Spacer()
                Text("Chose icon")
                    .bold()
                Spacer()
            }
            .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(icons, id: \.self) { icon in
                        Image(icon)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                                    .opacity(0.5)
                            }
                            .onTapGesture {
                                realmManager.icon = icon
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CustomSubscriptionIcon()
}
