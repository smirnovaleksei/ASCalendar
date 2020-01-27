//
//  ASDateManager.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 30.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI
import Combine

final class ASDateManager: ObservableObject {
    
    // MARK: - Source Of Truth
    
    @Published private(set) var firstSelected: Date?
    @Published private(set) var secondSelected: Date?
    
    // MARK: - Public Properties
    
    let startDate: Date
    let endDate: Date
    let settings: PrimitiveSettingsConfiguration
        
    // MARK: - Initializers
    
    init(settings: PrimitiveSettingsConfiguration, startDate: Date, endDate: Date) {
        self.settings = settings
        self.startDate = startDate
        self.endDate = endDate
    }
    
    // MARK: - Public Methods
    
    public func getSections() -> [Section] {
        var sections = [Section]()
        var _start = startDate
        while _start <= endDate {
            sections.append(Section(monthName: _start.month(),
                                    datesPerMonth: Date.dates(from: _start.startOfMonth(calendar: settings.calendar),
                                                              to: _start.endOfMonth(calendar: settings.calendar), calendar: settings.calendar)))
            _start = settings.calendar.date(byAdding: .month, value: 1, to: _start)!
        }
        return sections
    }
    
    public func select(date: ASDate) {
        
        if !date.isDate { return }
        
        if firstSelected != nil && secondSelected != nil {
            
            if date.date == secondSelected {
                secondSelected = nil
                return
            }
            
            if date.date == firstSelected {
                firstSelected = secondSelected
                secondSelected = nil
                return
            }
            
            if date.date! < firstSelected! {
                firstSelected = date.date
            } else {
                secondSelected = date.date
            }
            return
        }

        if firstSelected == nil {
            firstSelected = date.date
        } else {
            
            if firstSelected == date.date {
                firstSelected = nil
                return
            }
            
            if secondSelected == nil {
                if date.date! > firstSelected! {
                    secondSelected = date.date
                } else if date.date! < firstSelected! {
                    secondSelected = date.date
                    swap(&firstSelected, &secondSelected)
                }
            } else {
                if date.date! == secondSelected! {
                    secondSelected = nil
                }
            }
        }
    }
    
    public func getState(for date: ASDate) -> DateState {
        if (date.date == firstSelected && date.isDate) || (date.date == secondSelected && date.isDate) {
            return .selected
        }
        
        if let f = firstSelected,
            let s = secondSelected {
            if let a = date.associatedDate, a >= f && a <= s {
                if (s.isLastDayOfMonth(calendar: settings.calendar) && s == a) || (f == a && f == startDate) {
                    return .default
                }
                return .between
            }
            
            if let d = date.date, d > f && d < s {
                return .between
            }
        }
        
        return .default
    }
    
    public func navText() -> String {
        if firstSelected == nil && secondSelected == nil {
            return "Choose Dates"
        } else if firstSelected != nil && secondSelected == nil {
            return settings.dateFormatter.string(from: firstSelected!)
        } else if firstSelected != nil && secondSelected != nil {
            return settings.dateFormatter.string(from: firstSelected!) + " - " + settings.dateFormatter.string(from: secondSelected!)
        } else {
            return ""
        }
    }
}

