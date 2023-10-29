//
//  Settings.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 29.10.2023.
//

import SwiftUI

struct Settings: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            ZStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .tint(.gray)
                            .fontWeight(.medium)
                            .frame(width: 18, height: 10)
                    }
                    Spacer()
                }
                Text("Settings")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding()
            
            ScrollView {
                
            }
        }
    }
}

#Preview {
    Settings()
}
