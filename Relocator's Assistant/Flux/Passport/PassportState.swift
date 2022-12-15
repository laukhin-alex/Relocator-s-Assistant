//
//  PassportState.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture

struct PassportState: Equatable {
    static func == (lhs: PassportState, rhs: PassportState) -> Bool {
        return lhs.defaults == rhs.defaults
    }
    
    @BindableState var halfYearDay = DateOfExpiryModal.init().halfYearDay
    @BindableState var currentDay = DateOfExpiryModal.init().currentDay
    @BindableState var dateOfExpiry = DateOfExpiryModal.init().dateOfExpiry
    @BindableState var dateOfExpiryMoreThanHalfYear: Bool = false
    var defaults: UserDefaultsPassportDate?
}
