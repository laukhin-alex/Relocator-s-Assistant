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
    PassportCheckingEnvironment> { state, action, environment in
        switch action {
        case .binding:
            if state.dateOfExpiry > state.halfYearDay ?? Date() {
                print(state.dateOfExpiry)
                print("YES")
                state.dateOfExpiryMoreThanHalfYear = true
            } else {
                print("No")
                state.dateOfExpiryMoreThanHalfYear = false
            }
            if state.havingPassport == false {
                state.chosenCountries = state.accessibleCountriesWithoutPassport
                print(state.dateOfExpiryMoreThanHalfYear)
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            } else if state.havingPassport == true
                        && state.dateOfExpiryMoreThanHalfYear != false
            {                state.chosenCountries = state.accessibleCountriesWithoutPassport
                print(state.dateOfExpiryMoreThanHalfYear)
                for i in state.chosenCountries {
                    print(i.countryName)
                }
            } else {
                state.chosenCountries = state.accessibleCountriesWithPassport
                print(state.dateOfExpiryMoreThanHalfYear)
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
            print("OnAPPEAR!")
            return .none
        }
    }
    .binding()
