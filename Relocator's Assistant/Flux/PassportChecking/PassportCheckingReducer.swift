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
            if state.relocateStepsState.havingPassport == true && state.passportIsMoreTanFiveYears == true {
                state.relocateStepsState.chosenCountries = state.relocateStepsState.accessibleCountriesWithPassport
                for i in state.relocateStepsState.chosenCountries {
                    print(i.countryName)
                }
            } else {
                state.relocateStepsState.chosenCountries = state.relocateStepsState.accessibleCountriesWithoutPassport
                for i in state.relocateStepsState.chosenCountries {
                    print(i.countryName)
                }
            }
            return .none
        case let .selectCountry(countryModel):
            state.countryDescriptionState = ChoosingCountryState(
                chosenCountryFlag: countryModel.flag,
                chosenCountryName: countryModel.countryName,
                choseCountryDescription: countryModel.countryDescription)
            return .none
        case let .choosingCountryActions(choosingCountryActions):
            return .none
        }


    }
    .binding()
