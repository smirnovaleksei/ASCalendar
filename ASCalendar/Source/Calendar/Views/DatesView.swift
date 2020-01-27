//
//  DatesView.swift
//  ASCalendar
//
//  Created by finch on 24/12/2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI

struct DatesView: View {
    
    // MARK: - Source Of Truth
    
    @ObservedObject var manager: ASDateManager
    
    // MARK: - Public Properties
    
    let dates: [ASDate]
    
    // MARK: - Body
    
    var body: some View {
        GridStack(rows: dates.count.dateCeiled(), columns: .numberDaysInWeek) { row, col in
            DateView(date: self.getDate(row: row, col: col),
                     state: self.manager.getState(for: self.getDate(row: row, col: col)))
                .onTapGesture {
                    self.manager.select(date: self.getDate(row: row, col: col))
                }
        }
    }
    
    // MARK: - Private Methods
    
    private func getDate(row: Int, col: Int) -> ASDate {
        let index = row * .numberDaysInWeek + col
        return dates[index]
    }
    
}


//struct DatesView_Previews: PreviewProvider {
//    static var previews: some View {
//        DatesView(manager: ASDateManager(), dates: [Date()])
//    }
//}


