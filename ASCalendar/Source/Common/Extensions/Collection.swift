//
//  Collection.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 29.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
