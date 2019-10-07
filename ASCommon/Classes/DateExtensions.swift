//
//  DateExtensions.swift
//  ASCommon
//
//  Created by Andrea Stevanato on 07/10/2019.
//

import Foundation

extension Date {
    
    static var currentTimeTomorrow: Date {
        return Date().sameTimeNextDay()
    }
    
    static var currentTimeYesterday: Date {
        return Date().sameTimeNextDay(inDirection: .backward)
    }
    
    func sameTimeNextDay(inDirection direction: Calendar.SearchDirection = .forward, using calendar: Calendar = .current) -> Date {
        let components = calendar.dateComponents(
            [.hour, .minute, .second, .nanosecond],
            from: self
        )
        
        return calendar.nextDate(
            after: self,
            matching: components,
            matchingPolicy: .nextTime,
            direction: direction
        )!
    }
}
