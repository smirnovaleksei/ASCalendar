//
//  GridView.swift
//  ASCalendar
//
//  Created by Алексей Смирнов on 24.12.2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    
    // MARK: - Pubic Properties
    
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    // MARK: - Initializers
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: -0.5) {
            ForEach(0 ..< rows) { row in
                HStack(spacing: 0) {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}


