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
                        notificationHandler.deleteNotification(id: realmManager.notificationId)
                        realmManager.notificationId = notificationHandler.createNotification(every: realmManager.selectedCyclePeriod,
                                                                                             date: realmManager.selectedCycleDate,
                                                                                             from: realmManager.firstBillDate,
                                                                                             nextNotificationDay: realmManager.selectedDay,
                                                                                             nextNotificationInterval: realmManager.selectedDate,
                                                                                             repeats: true,
                                                                                             title: "\(realmManager.title)'s bill",
                                                                                             body: "This is notification from subscription manager, you'll pay \(realmManager.price) \(realmManager.currency)")
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
//                        TextField(text: $realmManager.price) {
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
                        Text("\(realmManager.firstBillDate.formatted(date: .long, time: .omitted))")
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
                        Text("\(realmManager.selectedCycle) \(realmManager.selectedCyclePeriod) \(realmManager.selectedCycleDate)")
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
                        Text("\(realmManager.date == 0 ? "Forever" : "\(realmManager.date)") \(pickersVM.dayArray[realmManager.day])")
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
                        $realmManager.subscriptionToDelete.delete()
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
            .background(Color(hex: realmManager.colorHex))
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
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
        }
    }
}

//#Preview {
//    EditSubscription()
//}
