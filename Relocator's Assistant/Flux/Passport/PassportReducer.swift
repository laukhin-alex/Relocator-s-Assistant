//
//  PassportReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture


let passportReducer = AnyReducer<
    PassportState,
    PassportActions,
    PassportEnvironment> { state, action, environment in

        switch action {
        case .dateOfExpiryCheck:
            if  state.dateOfExpiry > state.currentDate {
                print("YES!")
                print(state.dateOfExpiry)
                print(state.currentDate)
                state.dateOfExpiryMoreThanHalfYear = true
            } else {
                print("NO!!!")
            }
            return .none
        }

    }
