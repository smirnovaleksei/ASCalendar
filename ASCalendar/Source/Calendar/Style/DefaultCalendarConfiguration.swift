//
//  DefaultCalendarStyle.swift
//  ASCalendar
//
//  Created by finch on 16.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import SwiftUI

struct DefaultCalendarConfiguration: PrimitiveCalendarCofiguration {
    
    var calendar: Calendar = .current
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }

    var textColor: Color = .black
    
    var cellColor: Color = .white
    
    var font: Font = .custom("DIN Alternate", size: 25)
    
    var selectedTextColor: Color = .white
    
    var selectedCellColor: Color = .blue
    
    var beetweenTextColor: Color = .black
    
    var betweenCellColor: Color = Color.init(UIColor(red: 233/255, green: 240/255, blue: 247/255, alpha: 0.8))
    
}

