//
//  Popover.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct DatePickerView: View {
    @State var selectedDate = Date.now
    var body: some View {
        List{
            DatePicker("Select Your DOB", selection:$selectedDate,in:Date.now...threeMonthsFromNow, displayedComponents: .date).labelsHidden()
        }
        var threeMonthsFromNow:Date{
            Calendar.current.date(byAdding: .month, value: 3, to: .now )!
        }
    }
}


#Preview {
    DatePickerView()
}
