//
//  CustomSegmentedControll.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct AddSubscriptionSegmentedControl: View {
    
    @State var selectedTab = 0
    
    @State var popularChosen = true
    @State var allChosen = false
    
//    @EnvironmentObject var realmManager: RealmManager

    var body: some View {
        
        VStack {
            HStack {
                Text("Popular")
                    .fontWeight(.medium)
                    .opacity(popularChosen ? 1 : 0.5)
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.1)) {
                            popularChosen = true
                            allChosen = false
                            selectedTab = 0
                        }
                    }
                
                Text("All")
                    .fontWeight(.medium)
                    .font(.system(size: 15))
                    .opacity(allChosen ? 1 : 0.5)
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.1)) {
                            popularChosen = false
                            allChosen = true
                            selectedTab = 1
                        }
                    }
                
            }
            
            ZStack {
                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.33, height: 2)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                        .offset(x: popularChosen ? UIScreen.main.bounds.maxX - UIScreen.main.bounds.maxX * 1.25 : UIScreen.main.bounds.maxX - UIScreen.main.bounds.maxX * 0.75)
                }
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
            }
            TabView(selection: $selectedTab) {
                
                PopularTemplates().tag(0)
                AllTemplates().tag(1)
                
            }
        }
        .onChange(of: selectedTab) { _ in
            withAnimation(.spring(response: 0.4)) {
                if selectedTab == 0 {
                    popularChosen = true
                    allChosen = false
                } else {
                    popularChosen = false
                    allChosen = true
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

