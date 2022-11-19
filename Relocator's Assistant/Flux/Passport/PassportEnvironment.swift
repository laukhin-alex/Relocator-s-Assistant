//
//  PassportEnvironment.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture

struct PassportEnvironment {
    var dateOfExpiry: Bool = false

    func dateOfExpiryCheck(_ dateOfExpiry: Bool) -> Bool {
        return dateOfExpiry
    }
}
