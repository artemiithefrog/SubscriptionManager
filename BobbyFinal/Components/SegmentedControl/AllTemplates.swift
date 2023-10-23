//
//  AllTemplates.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct AllTemplates: View {
    
    var templatesVM = TemplatesViewModel()
    @StateObject var realmManager = RealmManager()
    @State private var showNewSubscription = false
    
    var body: some View {
        ScrollView {
            ForEach(templatesVM.allTemplates) { template in
                
                HStack {
                    Image(template.icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.leading)
                        .padding(.trailing, 8)
                        .foregroundColor(template.color)
                    Text(template.name)
                        .foregroundColor(template.color)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(.trailing)
                        .foregroundColor(template.color)
                }
                .frame(width: UIScreen.main.bounds.width - 10, height: 65)
                .overlay (
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(template.color, lineWidth: 1)
                )
                .padding(EdgeInsets(top: 3, leading: 8, bottom: 0, trailing: 8))
                .onTapGesture {
                    realmManager.title = template.name
                    realmManager.color = template.color
                    realmManager.icon = template.icon
                    
                    showNewSubscription = true
                }
            }
        }
        .navigationDestination(isPresented: $showNewSubscription) {
            NewSubscription()
                .environmentObject(realmManager)
        }
    }
}
