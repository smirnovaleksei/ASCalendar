//
//  ASDate.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 29.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import Foundation

struct ASDate {
    
    /// The real date
    let date: Date?
    
    /// Date for indays and outdays
    /// For indays associatedDate is equal to the first day of month
    /// For outdays associatedDate is equal to the last day of month
    let associatedDate: Date?
    
    /// Bool value
    /// Returns true if date isn't nil and associatedDate is nil
    /// Returns false otherwise
    let isDate: Bool
    
    // MARK: - Initializers
    
    init(date: Date?, associatedDate: Date?) {
        self.date = date
        self.associatedDate = associatedDate
        self.isDate = date != nil && associatedDate == nil
    }
    
}
