//
//  DateOfExpiryModal.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation

struct DateOfExpiryModal: Equatable {
    let dateFormatter = DateFormatter()

    var dateOfExpiry = Date()
    let currentDay = Date()
    let halfYearDay = Calendar.current.date(byAdding: .day, value: 180, to: Date())
    init() {
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "ru_RU")
    }
}
