//
//  EnvironmentValues.swift
//  ASCalendar
//
//  Created by Aleksei Smirnov on 26.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import SwiftUI

struct CalendarStyleKey: EnvironmentKey {
    
    typealias Value = PrimitiveCalendarCofiguration
    
    static var defaultValue: PrimitiveCalendarCofiguration = DefaultCalendarConfiguration()
    
}

extension EnvironmentValues {
    
    var calendarStyle: PrimitiveCalendarCofiguration {
        
        get {
            return self[CalendarStyleKey.self]
        }
    
        set {
            self[CalendarStyleKey.self] = newValue
        }
    }
    
}
