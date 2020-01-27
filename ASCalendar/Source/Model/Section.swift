//
//  Section.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 29.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import Foundation

struct Section: Identifiable {
    
    let id = UUID()
    
    let monthName: String
    
    let datesPerMonth: [ASDate]

}
