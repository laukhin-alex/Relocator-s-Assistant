//
//  PassportCheckingReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 25.11.22.
//

import Foundation
import ComposableArchitecture
import SwiftUI



let passportCheckingReducer = AnyReducer<
    PassportCheckingState,
    PassportCheckingActions,
    PassportCheckingEnvironment>.combine(
        passportReducer.pullback(
            state: \.passportState,
            action: /PassportCheckingActions.passportAction,
            environment: { (_:PassportCheckingEnvironment) in
                PassportEnvironment()
            }),
        AnyReducer { state, action, environment in
        switch action {
        case let .passportAction(currentAction):
            print("CHANGING COuntries")
            state.passportState.dateOfExpiry = environment.repo.getUserPassportDate()
            if state.passportState.dateOfExpiryMoreThanHalfYear  {
//                state.passportState.defaults?.getUserPassportDate()
                state.chosenCountries = [armenia, georgia, kasachstan, turkey]
//                print(state.chosenCountries)
            } else {
                state.chosenCountries = [armenia, kasachstan]
//                print(state.chosenCountries)
                print(state.passportState.dateOfExpiryMoreThanHalfYear)
//
            }
            return .none
        case .binding:
            if state.havingPassport && state.passportState.dateOfExpiryMoreThanHalfYear  {
                state.chosenCountries = state.accessibleCountriesWithPassport
                print(state.passportState.dateOfExpiryMoreThanHalfYear)
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            } else if state.havingPassport == true
                        && state.passportState.dateOfExpiryMoreThanHalfYear == false
            {                state.chosenCountries = state.accessibleCountriesWithoutPassport
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
            if choosingCountryActions == .back {
                state.choosingCountryState = nil
            }
            return .none        
        }
    }
    .binding()
)
    .debug()
