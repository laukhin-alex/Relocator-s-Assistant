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
    let currentDate = Date()
}
