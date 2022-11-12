//
//  PassportReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture


let passportReducer = Reducer<
    PassportState,
    PassportActions,
    PassportEnvironment> { state, action, environment in

        switch action {
        case .dateOfExpiryCheck:
            return .none
        }

    }
