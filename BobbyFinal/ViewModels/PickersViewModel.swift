//
//  PickersViewModel.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

class PickersViewModel: ObservableObject {
    
    @Published var firstBillDate = Date()
    
    @Published var currencies = ["$", "€", "£", "¥", "₹", "₽", "₿", "₱", "฿", "₪", "₩", "₫"]
    
    //    Remid me Picker
    @Published var selectedDate = 31
    @Published var selectedDay = ""
    @Published var selectedTime = ""
    
    var timeArray = ["", "before"]
    
    //    Duration Picker
    @Published var date = 0
    @Published var day = 0
    
    var dateArray = Array(1...30)
    var dayArray = ["", "Day(s)", "Week(s)", "Month(s)", "Year(s)"]
    
    //    Cycle Picker
    @Published var selectedCycle = "Every"
    @Published var selectedCyclePeriod = 1
    @Published var selectedCycleDate = "Month(s)"
    
    var cycle = ["Every"]
    var cyclePeriod = Array(1...30)
    var cycleDate = ["Day(s)", "Week(s)", "Month(s)", "Year(s)"]
    
    //    открытие щита с пикерами
    @Published var showPicker = false
    
    // Пикеры открыты/закрыты
    @Published var currencyPickerIsAppear = false
    @Published var firstBillPickerIsAppear = false
    @Published var cyclePickerIsAppear = false
    @Published var durationPickerIsAppear = false
    @Published var remindMePickerIsAppear = false
    
    func openPickers(currencyPickerIsAppear: Bool, firstBillPickerIsAppear: Bool, cyclePickerIsAppear: Bool, durationPickerIsAppear: Bool, remindMePickerIsAppear: Bool) {
        self.showPicker = true
        self.currencyPickerIsAppear = currencyPickerIsAppear
        self.firstBillPickerIsAppear = firstBillPickerIsAppear
        self.cyclePickerIsAppear = cyclePickerIsAppear
        self.durationPickerIsAppear = durationPickerIsAppear
        self.remindMePickerIsAppear = remindMePickerIsAppear
    }
    
    func closePickers() {
        self.showPicker = false
        self.currencyPickerIsAppear = false
        self.firstBillPickerIsAppear = false
        self.cyclePickerIsAppear = false
        self.durationPickerIsAppear = false
        self.remindMePickerIsAppear = false
    }
}
