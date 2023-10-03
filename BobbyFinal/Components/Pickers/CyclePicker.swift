//
//  CyclePicker.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

struct CyclePicker: View {
    
    @Binding var selectedCycle: String
    @Binding var selectedCyclePeriod: Int
    @Binding var selectedCycleDate: String
    
    var cycle: Array<String>
    var cyclePeriod: Array<Int>
    var cycleDate: Array<String>
    
    var body: some View {
        
        HStack(spacing: -15) {
            Picker("", selection: $selectedCycle) {
                ForEach(cycle, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
            Picker("", selection: $selectedCyclePeriod) {
                ForEach(cyclePeriod, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
            Picker("", selection: $selectedCycleDate) {
                ForEach(cycleDate, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
        }
    }
}
