//
//  EditSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 06.10.2023.
//

import SwiftUI

struct EditSubscription: View {
    
    let notificationHandler = NotificationHandler()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var pickersVM: PickersViewModel
    
    @FocusState var nameIsFocused: Bool
    @FocusState var priceIsFocused: Bool
    @FocusState var descriptionIsFocused: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                        pickersVM.closePickers()
                    } label: {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .tint(.white)
                            .fontWeight(.medium)
                            .frame(width: 22, height: 12)
                            .padding(.leading)
                    }
                    .frame(width: 60)
                    Spacer()
                    Text(realmManager.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        realmManager.updateTask(id: realmManager.objectId)
                        notificationHandler.deleteNotification(id: realmManager.selectedSusbscription.notificationId)
                        realmManager.notificationId = notificationHandler.createNotification(every: realmManager.selectedSusbscription.selectedCyclePeriod,
                                                                                             date: realmManager.selectedSusbscription.selectedCycleDate,
                                                                                             from: realmManager.selectedSusbscription.firstBillDate,
                                                                                             nextNotificationDay: realmManager.selectedSusbscription.selectedDay,
                                                                                             nextNotificationInterval: realmManager.selectedSusbscription.selectedDate,
                                                                                             repeats: true,
                                                                                             title: "\(realmManager.selectedSusbscription.title)'s bill",
                                                                                             body: "This is notification from subscription manager, you'll pay \(realmManager.selectedSusbscription.price) \(realmManager.selectedSusbscription.currency)")
                        dismiss()
                        realmManager.deinitData()
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                    .frame(width: 60)
                }
                .padding(.top)
                Divider()
                    .frame(height: 0.5)
                    .overlay(.white)
                    .opacity(0.5)
                ScrollView {
                    HStack {
                        Image(realmManager.selectedSusbscription.icon)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                        
                        Spacer()
                        VStack {
                            HStack {
                                Spacer()
                                Text("\(realmManager.selectedSusbscription.currency)")
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
                        TextField(text: $realmManager.selectedSusbscription.price) {
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
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        TextField(text: $realmManager.selectedSusbscription.title) {
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
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    HStack {
                        Text("Description")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        TextField(text: $realmManager.selectedSusbscription.descriptions) {
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
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("Categories")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("First bill")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(realmManager.selectedSusbscription.firstBillDate.formatted(date: .long, time: .omitted))")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.6)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
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
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("Cycle")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(realmManager.selectedSusbscription.selectedCycle) \(realmManager.selectedSusbscription.selectedCyclePeriod) \(realmManager.selectedSusbscription.selectedCycleDate)")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.6)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
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
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("Duration")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(realmManager.selectedSusbscription.date == 0 ? "Forever" : "\(realmManager.selectedSusbscription.date)") \(pickersVM.dayArray[realmManager.selectedSusbscription.day])")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.6)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
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
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("Remind me")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        if realmManager.selectedSusbscription.selectedDate == 31 {
                            Text("Never")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(0.6)
                        } else if realmManager.selectedSusbscription.selectedDate == 32 {
                            Text("Same day")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(0.6)
                        } else {
                            Text("\(realmManager.selectedSusbscription.selectedDate) \(realmManager.selectedSusbscription.selectedDay) \(realmManager.selectedSusbscription.selectedTime)")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(0.6)
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
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
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white)
                        .opacity(0.5)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Text("More Options")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    Button {
                        $realmManager.selectedSusbscription.delete()
                        realmManager.getTasks()
                        realmManager.deinitData()
                        notificationHandler.deleteNotification(id: realmManager.notificationId)
                        dismiss()
                    } label: {
                        Text("DELETE SUBSCRIPTION")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .opacity(0.6)
                    }
                    .padding(.top, 25)

                }
            }
            .ignoresSafeArea(.keyboard)
            .background(Color(hex: realmManager.selectedSusbscription.colorHex))
            VStack {
                if pickersVM.showPicker {
                    VStack {
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
                            Picker(selection: $realmManager.selectedSusbscription.currency, label: Text("Currency")) {
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
                            CyclePicker(selectedCycle: $realmManager.selectedSusbscription.selectedCycle, selectedCyclePeriod: $realmManager.selectedSusbscription.selectedCyclePeriod, selectedCycleDate: $realmManager.selectedSusbscription.selectedCycleDate, cycle: pickersVM.cycle, cyclePeriod: pickersVM.cyclePeriod, cycleDate: pickersVM.cycleDate)
                        } else if pickersVM.durationPickerIsAppear {
                            DurationPicker(date: $realmManager.selectedSusbscription.date, day: $realmManager.selectedSusbscription.day, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray)
                        } else {
                            RemindMePicker(selectedDate: $realmManager.selectedSusbscription.selectedDate, selectedDay: $realmManager.selectedSusbscription.selectedDay, selectedTime: $realmManager.selectedSusbscription.selectedTime, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray, timeArray: pickersVM.timeArray)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
                    .transition(.move(edge: .bottom))
                }
            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
        }
    }
}
