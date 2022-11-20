//
//  Extensions.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation


extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}

