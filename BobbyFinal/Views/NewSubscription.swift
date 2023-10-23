//
//  NewSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct NewSubscription: View {

    let notificationHandler = NotificationHandler()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var pickersVM: PickersViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @FocusState var nameIsFocused: Bool
    @FocusState var priceIsFocused: Bool
    @FocusState var descriptionIsFocused: Bool
    
    @State var isDisclosed: Bool = false
    
    var body: some View {
        
//        VStack {
//            HStack {
//                Button {
//                    presentationMode.wrappedValue.dismiss()
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .bold()
//                }
//                .tint(.gray)
//            }
//            ScrollView {
//                
//            }
//        }
        
        
        NavigationStack {
            VStack {
                ZStack {
                    ScrollView {
                        VStack {
                            ZStack {
                                VStack {
                                    //                                                                currency + price
                                    HStack {
                                        Image(realmManager.icon)
                                            .resizable()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(.white)
                                        
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
                                                            priceIsFocused = false
                                                            nameIsFocused = false
                                                            descriptionIsFocused = false
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
                                                .opacity(priceIsFocused ? 1 : 0.2)
                                        )
                                        .keyboardType(.decimalPad)
                                        .focused($priceIsFocused)
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
                                        .focused($nameIsFocused)
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
                                        .focused($nameIsFocused)
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
                                                priceIsFocused = false
                                                nameIsFocused = false
                                                descriptionIsFocused = false
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
                                                priceIsFocused = false
                                                nameIsFocused = false
                                                descriptionIsFocused = false
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
                                                priceIsFocused = false
                                                nameIsFocused = false
                                                descriptionIsFocused = false
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
                                                priceIsFocused = false
                                                nameIsFocused = false
                                                descriptionIsFocused = false
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
            .ignoresSafeArea(.keyboard)
            
            if pickersVM.showPicker {
                VStack {
                    Divider()
                        .frame(height: 1)
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                pickersVM.closePickers()
                            }
                        } label: {
                            Text("Done")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                        }
                    }
                    .padding()
                    Spacer()
                    if pickersVM.currencyPickerIsAppear {
                        Picker(selection: $realmManager.currency, label: Text("Currency")) {
                            ForEach(pickersVM.currencies, id: \.self) { symbol in
                                Text(symbol)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(maxWidth: .infinity)
                    } else if pickersVM.firstBillPickerIsAppear {
                        DatePicker("", selection: $realmManager.firstBillDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                    } else if pickersVM.cyclePickerIsAppear {
                        CyclePicker(selectedCycle: $realmManager.selectedCycle, selectedCyclePeriod: $realmManager.selectedCyclePeriod, selectedCycleDate: $realmManager.selectedCycleDate, cycle: pickersVM.cycle, cyclePeriod: pickersVM.cyclePeriod, cycleDate: pickersVM.cycleDate)
                    } else if pickersVM.durationPickerIsAppear {
                        DurationPicker(date: $realmManager.date, day: $realmManager.day, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray)
                    } else {
                        RemindMePicker(selectedDate: $realmManager.selectedDate, selectedDay: $realmManager.selectedDay, selectedTime: $realmManager.selectedTime, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray, timeArray: pickersVM.timeArray)
                    } 
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
                .transition(.move(edge: .bottom))
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10, height: 17)
                    
                }
                .tint(.gray)
            }
            ToolbarItem(placement: .principal) {
                Text("New Subscription")
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if realmManager.price != "" {
                        realmManager.addTask()
                        realmManager.notificationId = notificationHandler.createNotification(every: realmManager.selectedCyclePeriod,
                                                                                             date: realmManager.selectedCycleDate,
                                                                                             from: realmManager.firstBillDate,
                                                                                             nextNotificationDay: realmManager.selectedDay,
                                                                                             nextNotificationInterval: realmManager.selectedDate,
                                                                                             repeats: true,
                                                                                             title: "\(realmManager.title)'s bill",
                                                                                             body: "This is notification from subscription manager, you'll pay \(realmManager.price) \(realmManager.currency)")
                        notificationHandler.askPermission()
                    } else {
                        
                    }
                } label: {
                    if realmManager.price != "" {
                        Text("Add")
                            .tint(realmManager.color)
                    } else {
                        Text("Add")
                            .tint(.gray)
                            .opacity(0.5)
                    }
                }
            }
            ToolbarItemGroup(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button {
                        nameIsFocused = false
                        priceIsFocused = false
                        descriptionIsFocused = false
                    } label: {
                        Text("Done")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            realmManager.deinitData()
//            realmManager.showNewSubscription = false
        }
    }
}

#Preview {
    NewSubscription()
}
