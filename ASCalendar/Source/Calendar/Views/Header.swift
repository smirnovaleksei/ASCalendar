//
//  Header.swift
//  ASCalendar
//
//  Created by finch on 24/12/2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI

struct Header: View {
    
    // MARK: - Pulic Propeties
    
    var title: String
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.custom("DINCondensed-Bold", size: 30))
                .padding()
            Spacer()
        }
    }
    
}
