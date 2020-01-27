//
//  PrimitiveCalendarConfiguration.swift
//  ASCalendar
//
//  Created by finch on 16.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import SwiftUI

typealias PrimitiveCalendarCofiguration = PrimitiveSettingsConfiguration & PrimitiveStyleConfiguration


protocol PrimitiveSettingsConfiguration {
    
    var calendar: Calendar { get }
       
    var dateFormatter: DateFormatter { get }
    
}

protocol PrimitiveStyleConfiguration {
    
    var textColor: Color { get }
    
    var cellColor: Color { get }
    
    var font: Font { get }
    
    var selectedTextColor: Color { get }
    
    var selectedCellColor: Color { get }
    
    var beetweenTextColor: Color { get }
    
    var betweenCellColor: Color { get }
    
}
