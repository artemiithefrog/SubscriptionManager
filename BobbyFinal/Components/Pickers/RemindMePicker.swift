//
//  RemindMePicker.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct RemindMePicker: View {
    
    @Binding var selectedDate: Int
    @Binding var selectedDay: String
    @Binding var selectedTime: String
    
    var dateArray: Array<Int>
    var dayArray: Array<String>
    var timeArray: Array<String>
    
    var body: some View {
        VStack {
            HStack(spacing: -15) {
                Picker("", selection: $selectedDate) {
                    Text("Never").tag(31)
                    Text("Same day").tag(32)
                    ForEach(dateArray, id: \.self) { date in
                        Text("\(date)")
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $selectedDay) {
                    ForEach(dayArray, id: \.self) { day in
                        Text("\(day)")
                    }
                }
                .pickerStyle(.wheel)
                Picker("", selection: $selectedTime) {
                    ForEach(timeArray, id: \.self) { time in
                        Text("\(time)")
                    }
                }
                .pickerStyle(.wheel)
            }
            .onChange(of: selectedDate) { value in
                if value < 31 {
                    withAnimation {
                        if selectedDay == "" {
                            selectedDay = "Day(s)"
                        }
                        if selectedTime == "" {
                            selectedTime = "before"
                        }
                    }
                } else {
                    withAnimation {
                        if selectedDay == "Day(s)" || selectedDay == "Week(s)" || selectedDay == "Month(s)" || selectedDay == "Year(s)" {
                            selectedDay = ""
                        }
                        if selectedTime == "before" {
                            selectedTime = ""
                        }
                    }
                }
            }
            .onChange(of: selectedDay) { value in
                if selectedDay == "Day(s)" || selectedDay == "Week(s)" || selectedDay == "Month(s)" || selectedDay == "Year(s)" {
                    withAnimation {
                        if selectedDate > 30 {
                            selectedDate = 1
                        }
                        if selectedTime == "" {
                            selectedTime = "before"
                        }
                    }
                } else {
                    withAnimation {
                        if selectedDate < 31 {
                            selectedDate = 31
                        }
                    }
                }
            }
            .onChange(of: selectedTime) { value in
                if selectedTime == "before" {
                    withAnimation {
                        if selectedDate > 31 {
                            selectedDate = 1
                        }
                        if selectedDay == "" {
                            selectedDay = "Day(s)"
                        }
                    }
                } else {
                    withAnimation {
                        if selectedDate < 31 {
                            selectedDate = 31
                        }
                        if selectedDay == "Day(s)" || selectedDay == "Week(s)" || selectedDay == "Month(s)" || selectedDay == "Year(s)" {
                            selectedDay = ""
                        }
                    }
                }
            }
        }
    }
}

