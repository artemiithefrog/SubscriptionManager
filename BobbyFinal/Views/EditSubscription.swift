//
//  EditSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 06.10.2023.
//

import SwiftUI

struct EditSubscription: View {
    
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
                        TextField("0,00", text: $realmManager.price)
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
                        TextField("Enter name", text: $realmManager.title)
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
                        TextField("Enter description", text: $realmManager.descriptions)
                            .multilineTextAlignment(.trailing)
                            .tint(.white)
                            .foregroundColor(.white)
                            .focused($descriptionIsFocused)
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
                        Text("\(pickersVM.firstBillDate.formatted(date: .long, time: .omitted))")
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
                        Text("\(pickersVM.selectedCycle) \(pickersVM.selectedCyclePeriod) \(pickersVM.selectedCycleDate)")
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
                        Text("\(pickersVM.date == 0 ? "Forever" : "\(pickersVM.date)") \(pickersVM.dayArray[pickersVM.day])")
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
                        if pickersVM.selectedDate == 31 {
                            Text("Never")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(0.6)
                        } else if pickersVM.selectedDate == 32 {
                            Text("Same day")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(0.6)
                        } else {
                            Text("\(pickersVM.selectedDate) \(pickersVM.selectedDay) \(pickersVM.selectedTime)")
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
                            DatePicker("", selection: $pickersVM.firstBillDate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(.wheel)
                        } else if pickersVM.cyclePickerIsAppear {
                            CyclePicker(selectedCycle: $pickersVM.selectedCycle, selectedCyclePeriod: $pickersVM.selectedCyclePeriod, selectedCycleDate: $pickersVM.selectedCycleDate, cycle: pickersVM.cycle, cyclePeriod: pickersVM.cyclePeriod, cycleDate: pickersVM.cycleDate)
                        } else if pickersVM.durationPickerIsAppear {
                            DurationPicker(date: $pickersVM.date, day: $pickersVM.day, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray)
                        } else {
                            RemindMePicker(selectedDate: $pickersVM.selectedDate, selectedDay: $pickersVM.selectedDay, selectedTime: $pickersVM.selectedTime, dateArray: pickersVM.dateArray, dayArray: pickersVM.dayArray, timeArray: pickersVM.timeArray)
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

#Preview {
    EditSubscription()
}
