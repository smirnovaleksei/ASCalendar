//
//  DateState.swift
//  ASCalendar
//
//  Created by Aleksei Smirnov on 26.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

enum DateState: Int {
    
    /// The date drawing as is, no decorations
    case `default`
    
    /// Decorations only for the first selected date and for the second selected date
    case selected
    
    /// Decorations for all dates between the first selected date and the second selected date
    case between
    
}
