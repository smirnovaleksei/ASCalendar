//
//  DateView.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 30.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI

struct DateView: View {
    
    // MARK: - Source Of Truth

    @Environment(\.calendarStyle) var style: PrimitiveCalendarCofiguration
    
    // MARK: - Public Properties
        
    let date: ASDate
    var state: DateState

    // MARK: - Body
    
    var body: some View {
        Text(text())
            .font(style.font)
            .foregroundColor(foregroundColor())
            .frame(width: .side, height: .side)
            .background(background())
    }
    
    // MARK: - Private methods

    private func foregroundColor() -> Color {
        switch state {
        case .selected:
            return style.selectedTextColor
        case .between:
            return style.beetweenTextColor
        case .default:
            return style.textColor
        }
    }
    
    private func background() -> Color {
        switch state {
        case .default:
            return style.cellColor
        case .selected:
            return style.selectedCellColor
        case .between:
            return style.betweenCellColor
        }
    }

    private func text() -> String {
        if let d = date.date?.get(.day, calendar: style.calendar) {
            return String(d)
        }
        return ""
    }
}
