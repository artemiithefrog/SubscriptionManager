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
                Text("GENERAL")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 13))
                Divider()
                Text("Security")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("ICloud Sync")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("MY SUBSCRIPTIONS")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()
                Text("Sort Subscriptions by")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("View Total as")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("Default Currency")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("DESIGN")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()
                Text("Sort Subscriptions by")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("View Total as")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                Text("Default Currency")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                
            }
        }
    }
}

#Preview {
    Settings()
}
