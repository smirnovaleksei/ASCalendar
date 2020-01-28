//
//  DefaultCalendarStyle.swift
//  ASCalendar
//
//  Created by finch on 16.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import SwiftUI

public struct DefaultCalendarConfiguration: PrimitiveCalendarCofiguration {
    
    public var calendar: Calendar = .current
    
    public var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }

    public var textColor: Color = .black
    
    public var cellColor: Color = .white
    
    public var font: Font = .custom("DIN Alternate", size: 25)
    
    public var selectedTextColor: Color = .white
    
    public var selectedCellColor: Color = .blue
    
    public var beetweenTextColor: Color = .black
    
    public var betweenCellColor: Color = Color.init(UIColor(red: 233/255, green: 240/255, blue: 247/255, alpha: 0.8))
    
    public init() { }

}

