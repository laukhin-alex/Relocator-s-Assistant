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
                state.dateOfExpiryMoreThanHalfYear = true
            } else {
                state.dateOfExpiryMoreThanHalfYear = false
            }
            return .none
        case .onAppear:
            
           var dateForPicker = environment.repo.getUserPassportDate()
            state.dateOfExpiry = dateForPicker
            print(dateForPicker)
            print(state.dateOfExpiry)
            return .none
        case .binding(_):
            return . none
        case let .dateChanged(newDate):

            environment.repo.saveUserPassportDate(dateOfExpiry: newDate)
            print("Changes Date : \(newDate)")
            print("Новая дата\(newDate)")
            return .none
//        default:
//            print("PassportReducerDefault: \(action)")
//            return .none
        }
    }

    .binding()
    .debug()
