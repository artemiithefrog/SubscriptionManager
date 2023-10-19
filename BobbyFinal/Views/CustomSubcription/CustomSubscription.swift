//
//  CusctomSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 16.10.2023.
//

import SwiftUI

struct CustomSubscription: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var pickersVM: PickersViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    
    @State var isDisclosed: Bool = false
    @State var selectedIcon = ""
    @State var showIconPicker = false
    
    var icons = ["camera", "envelope", "graduation-cap", "home", "shopping-cart", "video-camera-alt"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 17)
                        
                    }
                    .tint(.gray)
                    Spacer()
                    Text("New Subscription")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Add")
                        .bold()
                        .tint(.gray)
                        .opacity(0.5)
                }
                .padding()
                ScrollView {
                    VStack {
                        ZStack {
                            VStack {
                                //                                                                currency + price
                                HStack {
                                    
                                    Button {
                                        showIconPicker.toggle()
                                    } label: {
                                        if selectedIcon == "" {
                                            Circle()
                                                .frame(width: 75, height: 75)
                                        } else {
                                            Image(selectedIcon)
                                                .resizable()
                                                .frame(width: 70, height: 70)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("\(realmManager.currency)")
                                                .font(.system(size: 27))
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .padding()
                                                .frame(width: 80, height: 50)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 7)
                                                        .stroke(Color.white, lineWidth: 1)
                                                        .opacity(pickersVM.currencyPickerIsAppear ? 1 : 0.2)
                                                )
                                                .onTapGesture {
                                                    withAnimation {
                                                        pickersVM.openPickers(currencyPickerIsAppear: true,
                                                                              firstBillPickerIsAppear: false,
                                                                              cyclePickerIsAppear: false,
                                                                              durationPickerIsAppear: false,
                                                                              remindMePickerIsAppear: false)
//                                                        priceIsFocused = false
//                                                        nameIsFocused = false
//                                                        descriptionIsFocused = false
                                                    }
                                                }
                                        }
                                        .padding(.trailing, 10)
                                    }
                                    TextField(text: $realmManager.price) {
                                        Text("0,00")
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    .font(.system(size: 27))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .tint(.white)
                                    .opacity(0.9)
                                    .multilineTextAlignment(.trailing)
                                    .padding()
                                    .frame(width: 140, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color.white, lineWidth: 1)
//                                            .opacity(priceIsFocused ? 1 : 0.2)
                                    )
                                    .keyboardType(.decimalPad)
//                                    .focused($priceIsFocused)
                                    .onTapGesture {
                                        pickersVM.closePickers()
                                    }
                                }
                                .padding()
                                
                                Divider()
                                    .frame(width: 330, height: 1)
                                    .overlay(.white)
                                    .opacity(0.5)
                                //                        name
                                HStack {
                                    Text("Name")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    TextField(text: $realmManager.title) {
                                        Text("Enter name")
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    .multilineTextAlignment(.trailing)
                                    .tint(.white)
                                    .foregroundColor(.white)
//                                    .focused($nameIsFocused)
                                    .onTapGesture {
                                        pickersVM.closePickers()
                                    }
                                }
                                .padding()
                                
                                Divider()
                                    .frame(width: 330, height: 1)
                                    .overlay(.white)
                                    .opacity(0.5)
                                //                        description
                                HStack {
                                    Text("Description")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    TextField(text: $realmManager.descriptions) {
                                        Text("Enter description")
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    .multilineTextAlignment(.trailing)
                                    .tint(.white)
                                    .foregroundColor(.white)
//                                    .focused($nameIsFocused)
                                    .onTapGesture {
                                        pickersVM.closePickers()
                                    }
                                }
                                .padding()
                                
                                Divider()
                                    .frame(width: 330, height: 1)
                                    .overlay(.white)
                                    .opacity(0.5)
                                //                        categories
                                HStack {
                                    Text("Categories")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                                .padding()
                                //                        more options
                                VStack {
                                    Divider()
                                        .frame(width: 330, height: 1)
                                        .overlay(.white)
                                        .opacity(0.5)
                                    HStack {
                                        Text("First bill")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("\(realmManager.firstBillDate.formatted(date: .long, time: .omitted))")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .opacity(0.6)
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            pickersVM.openPickers(currencyPickerIsAppear: false,
                                                                  firstBillPickerIsAppear: true,
                                                                  cyclePickerIsAppear: false,
                                                                  durationPickerIsAppear: false,
                                                                  remindMePickerIsAppear: false)
//                                            priceIsFocused = false
//                                            nameIsFocused = false
//                                            descriptionIsFocused = false
                                        }
                                    }
                                    .padding()
                                    
                                    Divider()
                                        .frame(width: 330, height: 1)
                                        .overlay(.white)
                                        .opacity(0.5)
                                    
                                    HStack {
                                        Text("Cycle")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("\(realmManager.selectedCycle) \(realmManager.selectedCyclePeriod) \(realmManager.selectedCycleDate)")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .opacity(0.6)
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            pickersVM.openPickers(currencyPickerIsAppear: false,
                                                                  firstBillPickerIsAppear: false,
                                                                  cyclePickerIsAppear: true,
                                                                  durationPickerIsAppear: false,
                                                                  remindMePickerIsAppear: false)
//                                            priceIsFocused = false
//                                            nameIsFocused = false
//                                            descriptionIsFocused = false
                                        }
                                    }
                                    .padding()
                                    
                                    Divider()
                                        .frame(width: 330, height: 1)
                                        .overlay(.white)
                                        .opacity(0.5)
                                    
                                    HStack {
                                        Text("Duration")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("\(realmManager.date == 0 ? "Forever" : "\(realmManager.date)") \(pickersVM.dayArray[realmManager.day])")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .opacity(0.6)
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            pickersVM.openPickers(currencyPickerIsAppear: false,
                                                                  firstBillPickerIsAppear: false,
                                                                  cyclePickerIsAppear: false,
                                                                  durationPickerIsAppear: true,
                                                                  remindMePickerIsAppear: false)
//                                            priceIsFocused = false
//                                            nameIsFocused = false
//                                            descriptionIsFocused = false
                                        }
                                    }
                                    .padding()
                                    
                                    Divider()
                                        .frame(width: 330, height: 1)
                                        .overlay(.white)
                                        .opacity(0.5)
                                    
                                    HStack {
                                        Text("Remind me")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Spacer()
                                        if realmManager.selectedDate == 31 {
                                            Text("Never")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .opacity(0.6)
                                        } else if realmManager.selectedDate == 32 {
                                            Text("Same day")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .opacity(0.6)
                                        } else {
                                            Text("\(realmManager.selectedDate) \(realmManager.selectedDay) \(realmManager.selectedTime)")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .opacity(0.6)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            pickersVM.openPickers(currencyPickerIsAppear: false,
                                                                  firstBillPickerIsAppear: false,
                                                                  cyclePickerIsAppear: false,
                                                                  durationPickerIsAppear: false,
                                                                  remindMePickerIsAppear: true)
//                                            priceIsFocused = false
//                                            nameIsFocused = false
//                                            descriptionIsFocused = false
                                        }
                                    }
                                    .padding()
                                }
                                .allowsHitTesting(isDisclosed ? true : false)
                                .frame(height: isDisclosed ? nil : 0, alignment: .top)
                                .clipped()
                                
                                //                        more options button
                                VStack {
                                    Divider()
                                        .frame(height: 1)
                                        .overlay(.white)
                                        .opacity(0.5)
                                        .padding(.top, isDisclosed ? 0 : -10)
                                    HStack {
                                        Text("MORE OPTIONS")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.white)
                                            .rotationEffect(.degrees(isDisclosed ? -180 : 0))
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                            isDisclosed.toggle()
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        .background(realmManager.color)
                        .cornerRadius(10)
                        .padding()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            realmManager.showCustomSubscription = false
        }
        .sheet(isPresented: $showIconPicker) {
            ForEach(icons, id: \.self) { icon in
                Button {
                    selectedIcon = icon
                    showIconPicker = false
                } label: {
                    Image(icon)
                        .resizable()
                        .frame(width: 70, height: 70)
                }
            }
        }
    }
}

#Preview {
    CustomSubscription()
}
