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
        case .binding(\.$dateOfExpiryMoreThanHalfYear):
            if state.dateOfExpiry > state.halfYearDay ?? Date() {
                print(state.dateOfExpiry)
                print("YES")
                state.dateOfExpiryMoreThanHalfYear = true

            } else {
                print("No")
                state.dateOfExpiryMoreThanHalfYear = false
            }
            print("Появился!")
            return .none
        case .onAppear:
            if state.dateOfExpiryMoreThanHalfYear {

            }
            return .none
        case .binding(_):
            return . none
        }
    }

    .binding()
