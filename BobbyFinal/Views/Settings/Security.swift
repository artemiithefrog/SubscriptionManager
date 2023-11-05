//
//  Security .swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 02.11.2023.
//

import SwiftUI

struct Security: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            HStack {
                ZStack {
                    Text("Security")
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
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Security()
}
