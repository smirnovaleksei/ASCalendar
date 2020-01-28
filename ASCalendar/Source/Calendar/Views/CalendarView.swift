//
//  ContentView.swift
//  ASCalendar
//
//  Created by finch on 24/12/2019.
//  Copyright © 2019 finch. All rights reserved.
//

import SwiftUI
import UIKit

struct CalendarView: View {
    
    // MARK: - Source Of Truth
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.calendarStyle) var style: PrimitiveCalendarCofiguration
    @ObservedObject var manager: ASDateManager
    
    // MARK: - Public Properties
    
    let action: ((Date?, Date?) -> Void)
        
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(manager.getSections()) { section in
                        MonthView(manager: self.manager, monthName: section.monthName, dates: section.datesPerMonth)
                            .drawingGroup()
                    }
                }
            }
            .navigationBarTitle(navigationBarTitle(), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.action(self.manager.firstSelected, self.manager.secondSelected)
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done")
                    .bold()
                    .foregroundColor(.blue)
            }))
        }
    }
    
    // MARK: - Private methods
    
    private func navigationBarTitle() -> Text {
        Text(manager.navText())
    }
    
}
