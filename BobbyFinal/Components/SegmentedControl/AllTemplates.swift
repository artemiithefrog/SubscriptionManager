//
//  AllTemplates.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct AllTemplates: View {
    
    @EnvironmentObject var realmManager: RealmManager
    var templatesVM = TemplatesViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(templatesVM.allTemplates) { template in
                Button {
                    templatesVM.selectedTemplate = template
                    
                    realmManager.title = template.name
                    realmManager.color = template.color
                    realmManager.showNewSubscription.toggle()
                } label: {
                    HStack {
                        template.icon
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
                }
            }
        }

    }
}

#Preview {
    AllTemplates()
}
