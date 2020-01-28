//
//  View.swift
//  ASCalendar
//
//  Created by finch on 16.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import SwiftUI

public extension View {

    func calendarSheet(startDate: String, endDate: String, isPresented: Binding<Bool>, configuration: PrimitiveCalendarCofiguration = DefaultCalendarConfiguration(), action: @escaping (Date?, Date?) -> Void) -> some View {
        return self.sheet(isPresented: isPresented) {            
            CalendarView(manager: ASDateManager(settings: configuration,
                                                startDate: configuration.dateFormatter.date(from: startDate)!,
                                                endDate: configuration.dateFormatter.date(from: endDate)!),
                         action: { (firstSelectedDate, secondSelectedDate) in
                action(firstSelectedDate, secondSelectedDate)
            })
            .environment(\.calendarStyle, configuration)
        }
    }
    
}
