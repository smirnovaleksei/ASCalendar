//
//  ContentView.swift
//  Example
//
//  Created by finch on 28.01.2020.
//  Copyright © 2020 smirnov-Development.com. All rights reserved.
//

import SwiftUI
import ASCalendar

struct ContentView: View {
    
    // MARK: - Source Of Truth
    
    @State var isPresented = false
    @State var firstSelectedDate: Date?
    @State var secondSelectedDate: Date?
    
    // MARK: - Private Properties
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                Text(text(from: firstSelectedDate))
                Text(text(from: secondSelectedDate))
            }
            .navigationBarTitle("Start Screen")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("Choose dates")
                })
                .calendarSheet(startDate: "01.01.2020", endDate: "31.12.2021", isPresented: self.$isPresented, configuration: MyCalendarStyle(), action: { (firstSelectedDate, secondSelectedDate) in
                    self.firstSelectedDate = firstSelectedDate
                    self.secondSelectedDate = secondSelectedDate
                })
            )
        }
    }
    
    private func text(from date: Date?) -> String {
        
        guard let date = date else {
            return "--"
        }
        
        return dateFormatter.string(from: date)
    }
    
}

