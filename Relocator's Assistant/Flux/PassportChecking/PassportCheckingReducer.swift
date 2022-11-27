//
//  PassportCheckingReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 25.11.22.
//

import Foundation
import ComposableArchitecture

let passportCheckingReducer = AnyReducer<
    PassportCheckingState,
    PassportCheckingActions,
    PassportCheckingEnvironment> { state, action, environment in
        switch action {
        case .binding:
            state.goodPassport = state.passportState.dateOfExpiryMoreThanHalfYear
            if state.passportIsMoreTanFiveYears == true && state.goodPassport == true {
                state.chosenCountries = state.accessibleCountriesWithPassport
                print(state.passportState.dateOfExpiryMoreThanHalfYear)
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            } else {
                state.chosenCountries = state.accessibleCountriesWithoutPassport
                print(state.passportState.dateOfExpiryMoreThanHalfYear)
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            }
            return .none
        case let .selectCountry(countryModel):
            state.choosingCountryState = ChoosingCountryState(
                chosenCountryFlag: countryModel.flag,
                chosenCountryName: countryModel.countryName,
                choseCountryDescription: countryModel.countryDescription)
            return .none
        case let .choosingCountryActions(choosingCountryActions):
            return .none
        }
    }
    .binding()
