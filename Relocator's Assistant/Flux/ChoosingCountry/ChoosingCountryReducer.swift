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
        case let .selectCountry(countryModel):
            state.chosenCountry = CountryDescriptionState.init(country: countryModel)
        }
        return .none
    }
