//
//  RelocateStepsReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture

let relocateStepsReducer = AnyReducer<
    RelocateStepsState,
    RelocateStepsActions,
    RelocateStepsEnvironment> { state, action, environment in
        switch action {
        case .binding:
            print(state.passportCheckingState.passportState.dateOfExpiryMoreThanHalfYear)
            return .none
        }
    }
    .binding()
