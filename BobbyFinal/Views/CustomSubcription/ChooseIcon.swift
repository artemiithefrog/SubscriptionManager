//
//  ChooseIcon.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 18.10.2023.
//

import SwiftUI

struct ChooseIcon: View {
    
    @EnvironmentObject var realmManager: RealmManager
    var icons = ["camera", "envelope", "graduation-cap", "home", "shopping-cart", "video-camera-alt"]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
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
                        Button {
                            realmManager.showIconPicker = false
                            realmManager.icon = icon
                        } label: {
                            Image(icon)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(25)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray, lineWidth: 1)
                                        .opacity(0.5)
                                }
                        }
                        .tint(.black)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ChooseIcon()
}
