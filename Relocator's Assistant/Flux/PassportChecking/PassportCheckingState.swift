//
//  PassportCheckingState.swift
//  Relocator's Assistant
//
//  Created by Александр on 25.11.22.
//

import Foundation
import ComposableArchitecture

struct PassportCheckingState: Equatable {
    @BindableState var havingPassport: Bool = RelocateStepsModel.init().havingPassport
    var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
    var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    var passportIsMoreTanFiveYears = PassportState().dateOfExpiryMoreThanHalfYear
    @BindableState var goodPassport = false
    @BindableState var choosingCountryState = ChoosingCountryState()
    @BindableState var passportState = PassportState()
}
