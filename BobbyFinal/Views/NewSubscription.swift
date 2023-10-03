//
//  NewSubscription.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct NewSubscription: View {
    
    var selectedTemplate: Templates?
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var pickersVM: PickersViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @FocusState var nameIsFocused: Bool
    @FocusState var priceIsFocused: Bool
    @FocusState var descriptionIsFocused: Bool
    
    @State var isDisclosed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ScrollView {
                        VStack {
                            ZStack {
                                VStack {
                                    //                                                                currency + price
                                    HStack {
                                        Image(systemName: "icloud.circle")
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
//                                    .ignoresSafeArea(.keyboard)
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
                                        TextField("Enter name", text: $realmManager.title)
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
                                        TextField("Enter description", text: $realmManager.descriptions)
                                            .multilineTextAlignment(.trailing)
                                            .tint(.white)
                                            .foregroundColor(.white)
                                            .focused($descriptionIsFocused)
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
                                            Text("\(pickersVM.firstBillDate.formatted(date: .long, time: .omitted))")
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
                                            Text("\(pickersVM.selectedCycle) \(pickersVM.selectedCyclePeriod) \(pickersVM.selectedCycleDate)")
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
                                            Text("\(pickersVM.date == 0 ? "Forever" : "\(pickersVM.date)") \(pickersVM.dayArray[pickersVM.day])")
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
                            Spacer()
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
            
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
        }
    }
}

#Preview {
    NewSubscription()
}
