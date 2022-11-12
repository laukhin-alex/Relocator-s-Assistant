//
//  DateOfExpiryModal.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation

struct DateOfExpiryModal: Equatable {
    let dateFormatter = DateFormatter()
    let currentDate = Date()

    func dateOfExpiryCheck(_ dateOfExpiry: Date) {
       let dateOfExpiryCheck = dateOfExpiry - currentDate
        
    }
}
