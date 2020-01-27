//
//  Int.swift
//  ASCalendar
//
//  Created by Aleksei Smirnov on 26.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

extension Int {

    func dateCeiled() -> Self {
        if self % .numberDaysInWeek != 0 {
            return self / .numberDaysInWeek  + 1
        } else {
            return self / .numberDaysInWeek
        }
    }

}
