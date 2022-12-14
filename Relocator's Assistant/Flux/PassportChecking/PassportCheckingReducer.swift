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
            action: /PassportCheckingActions.onAppear,
            environment: { (_:PassportCheckingEnvironment) in
                PassportEnvironment()
            }),
        AnyReducer { state, action, environment in
        switch action {
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
            return .none
        case let .onAppear(action):
            print(action)
            print("OnAPPEAR!")
//            if action == .binding(binding<PassportState>) {
//                if state.passportState.dateOfExpiryMoreThanHalfYear || state.havingPassport {
//                    state.chosenCountries = state.accessibleCountriesWithPassport
//                    print("1")
//                    print(state.passportState.dateOfExpiryMoreThanHalfYear)
//                } else {
//                    state.chosenCountries = state.accessibleCountriesWithoutPassport
//                    print("2")
//                }
//
//            }
            return .none
        }
    }
    .binding()
)
