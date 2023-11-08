//
//  Settings.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 29.10.2023.
//

import SwiftUI

struct Settings: View {
    
    @Environment (\.dismiss) var dismiss
    @State private var showSecurityView = false
    @State private var isIcloudSyncOn = false
    @State private var showSortSubscription = false
    @State private var showViewTotal = false
    @State private var showDefaultCurrency = false
    @State private var showAppIcon = false
    
    var body: some View {
        
        NavigationStack {
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
            
            ScrollView(showsIndicators: false) {
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
                    .padding(.top, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        showSecurityView = true
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                HStack {
                    Text("iCloud Sync")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                    Toggle("", isOn: $isIcloudSyncOn)
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 20))
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("MY SUBSCRIPTIONS")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()

                HStack {
                    Text("Sort Subscriptions by")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                    Spacer()
                    Text("Alphabethical (Z - A)")
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top, 10)
                .onTapGesture {
                    showSortSubscription = true
                }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Text("View Total as")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                    Spacer()
                    Text("Average Expenses")
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top, 10)
                .onTapGesture {
                    showViewTotal = true
                }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Text("Default Currency")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                    Spacer()
                    Text("USD ($)")
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top, 10)
                .onTapGesture {
                    showDefaultCurrency = true
                }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("DESIGN")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()
                HStack {
                    Text("App Icon")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading)
                        .padding(.top, 10)
                        .font(.system(size: 15))
                }
                .onTapGesture {
                    showAppIcon = true
                }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("Theme")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("Font")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("UPGRADES")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()
                Text("View Upgrades")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("Restore Purchases")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("INFO")
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .font(.system(size: 13))
                Divider()
                Text("Feedback")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("About")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("Rate Bobby")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                Text("Submit More Subscriptions")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(.system(size: 15))
                    .onTapGesture {
                        
                    }
                Divider()
            }
            .navigationDestination(isPresented: $showSecurityView) {
                Security()
            }
            .navigationDestination(isPresented: $showSortSubscription) {
                SortSubscriptionBy()
            }
            .navigationDestination(isPresented: $showViewTotal) {
                ViewTotalAs()
            }
            .navigationDestination(isPresented: $showDefaultCurrency) {
                DefaultCurrency()
            }
            .navigationDestination(isPresented: $showAppIcon) {
                AppIcon()
            }
        }
    }
}

#Preview {
    Settings()
}
