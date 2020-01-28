//
//  MonthView.swift
//  ASCalendar
//
//  Created by finch on 24/12/2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI

struct MonthView: View {
    
    // MARK: - Source Of Truth

    @ObservedObject var manager: ASDateManager
    
    // MARK: - Public Properties
    
    let monthName: String
    let dates: [ASDate]

    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, content: {
            Header(title: monthName)
                .frame(height: 55)
            DatesView(manager: manager, dates: dates)
                .frame(height: height())
        })
    }
    
    // MARK: - Private Methods
    
    private func height() -> CGFloat {
        return CGFloat(dates.count.dateCeiled()) * CGFloat.side
    }
    
}

