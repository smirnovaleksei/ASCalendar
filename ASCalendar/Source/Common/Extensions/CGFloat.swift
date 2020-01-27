//
//  CGFloat.swift
//  ASCalendar
//
//  Created by Aleksei Smirnov on 26.01.2020.
//  Copyright © 2020 finch. All rights reserved.
//

import UIKit

extension Int {
    
    public static var numberDaysInWeek: Int {
        return 7
    }
    
}

extension CGFloat {
    
    public static var numberDaysInWeek: CGFloat {
        return 7.0
    }
    
    public static var side: CGFloat {
        return UIScreen.main.bounds.width / .numberDaysInWeek
    }
    
}
