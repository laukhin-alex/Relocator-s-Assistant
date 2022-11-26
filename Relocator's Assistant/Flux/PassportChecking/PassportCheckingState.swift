//
//  PassportCheckingState.swift
//  Relocator's Assistant
//
//  Created by Александр on 25.11.22.
//

import Foundation
import ComposableArchitecture

struct PassportCheckingState: Equatable {
    @BindableState var relocateStepsState = RelocateStepsState()
    var countryDescriptionState: CountryDescriptionState? = nil
     var passportIsMoreTanFiveYears = PassportState().dateOfExpiryMoreThanHalfYear
}
