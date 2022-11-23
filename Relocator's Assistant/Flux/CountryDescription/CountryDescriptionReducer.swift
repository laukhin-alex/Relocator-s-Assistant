//
//  CountryDescriptionReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture

let countryDescriptionReducer = AnyReducer<
    CountryDescriptionState,
    CountryDescriptionActions,
    CountryDescriptionEnvironment> { state, action, environment in
        switch action {
        case let .showCountry(countryModel):
            state.country = countryModel
            print(state.country ?? emptyCountry)
            return .none
        }
    }
