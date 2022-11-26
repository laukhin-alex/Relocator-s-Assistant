//
//  ChoosingCountryReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 26.11.22.
//

import Foundation
import ComposableArchitecture

let choosingCountryReducer = AnyReducer<
    ChoosingCountryState,
    ChoosingCountryActions,
    ChoosingCountryEnvironment> { state, action, environment in
        switch action {
        case .selectCountry:
            return .none
        }

    }
