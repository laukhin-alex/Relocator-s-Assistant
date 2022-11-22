//
//  RelocateStepsReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture

let RelocateStepsReducer = AnyReducer<
    RelocateStepsState,
    RelocateStepsActions,
    RelocateStepsEnvironment> { state, action, environment in
        switch action {
        case .binding:
            if state.havingPassport == true {
                state.chosenCountries = state.accessibleCountriesWithPassport
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            } else {
                state.chosenCountries = state.accessibleCountriesWithoutPassport
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            }
            return .none
        }
    }
    .binding()
