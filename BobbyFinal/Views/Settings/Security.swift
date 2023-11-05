//
//  Security .swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 02.11.2023.
//

import SwiftUI

struct Security: View {
    
    @State private var isUseFaceIdOn = false
    @State private var isUsePasscodeOn = false
    
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
                Divider()
                HStack {
                    Text("Use Face ID")
                    Spacer()
                    Toggle("", isOn: $isUseFaceIdOn)
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                Divider()
                    .padding(.bottom, 5)
                Divider()
                HStack {
                    Text("Use Passcode")
                    Spacer()
                    Toggle("", isOn: $isUsePasscodeOn)
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                Divider()
                HStack {
                    Text("Change Passcode...")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                Divider()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Security()
}
