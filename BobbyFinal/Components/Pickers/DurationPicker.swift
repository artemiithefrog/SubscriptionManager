//
//  DurationPicker.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct DurationPicker: View {
    
    @Binding var date: Int
    @Binding var day: Int
    
    var dateArray: Array<Int>
    var dayArray: Array<String>
    
    var body: some View {
        VStack {
            HStack(spacing: -15) {
                Picker(selection: $date, label: Text("Duration")) {
                    Text("Forever").tag(0)
                    ForEach(dateArray, id: \.self) { day in
                        Text("\(day)").tag(day)
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 2)
                .clipped()
                .labelsHidden()
                .pickerStyle(.wheel)
                
                Picker(selection: $day, label: Text("")) {
                    ForEach(0..<dayArray.count, id: \.self) { index in
                        Text(dayArray[index]).tag(index)
                    }
                }
                .labelsHidden()
                .pickerStyle(.wheel)
                .frame(width: UIScreen.main.bounds.width / 2)
                .clipped()
            }
            Spacer()
        }
        .onChange(of: date) { newValue in
            if newValue == 0 {
                withAnimation {
                    day = 0
                }
            }
            if newValue > 0 {
                withAnimation {
                    if day == 0 {
                        day = 1
                    }
                }
            }
        }
        .onChange(of: day) { newValue in
            if newValue == 0 {
                withAnimation {
                    date = 0
                }
            }
            if newValue > 0 {
                withAnimation {
                    if date == 0 {
                        date = 1
                    }
                }
            }
        }
    }
}
