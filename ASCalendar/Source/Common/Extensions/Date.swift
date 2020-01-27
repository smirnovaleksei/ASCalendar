//
//  Date.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 29.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import UIKit

extension Date {
    
    func startOfMonth(calendar: Calendar) -> Date {
        return calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self)))!
    }
    
    func endOfMonth(calendar: Calendar) -> Date {
        return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth(calendar: calendar))!
    }
    
    func month() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "LLLL YYYY"
        return dateformatter.string(from: self).uppercased()
    }
    
}

extension Date {
    
    static func dates(from fromDate: Date, to toDate: Date, calendar: Calendar) -> [ASDate] {
        
        func numberIndays(calendar: Calendar, date: Date) -> Int {
            let components = calendar.dateComponents([.year, .month], from: date)
            return calendar.component(.weekday, from: calendar.date(from: components)!)-2
        }
        
        func numberOutDays(count: Int) -> Int {
            count.dateCeiled() * .numberDaysInWeek - count
        }
        
        var dates = [ASDate]()
        var startDate = fromDate
        
        let inDates = numberIndays(calendar: calendar, date: startDate) >= 0 ? numberIndays(calendar: calendar, date: startDate) : 6
        dates += Array(repeating: ASDate(date: nil, associatedDate: startDate), count: inDates)
        
        while startDate <= toDate {
            dates.append(ASDate(date: startDate, associatedDate: nil))
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
        
        let out = numberOutDays(count: dates.count)
        dates += Array(repeating: ASDate(date: nil, associatedDate: toDate), count: out)
        
        return dates
    }
    
}

extension Date {
    
    func get(_ component: Calendar.Component, calendar: Calendar) -> Int {
        return calendar.component(component, from: self)
    }
    
}

extension Date {
    
    func isLastDayOfMonth(calendar: Calendar) -> Bool {
        self == self.endOfMonth(calendar: calendar)
    }
    
}
