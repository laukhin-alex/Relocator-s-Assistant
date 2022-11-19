//
//  PassportState.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture

struct PassportState: Equatable {
    
    @BindableState var currentDate = DateOfExpiryModal.init().currentDate
    @BindableState var dateOfExpiry = DateOfExpiryModal.init().dateOfExpiry
    @BindableState var dateOfExpiryMoreThanHalfYear: Bool = false
    
}
