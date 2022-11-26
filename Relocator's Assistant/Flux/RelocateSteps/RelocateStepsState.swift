//
//  RelocateStepsState.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct RelocateStepsState: Equatable {


    @BindableState var havingPassport: Bool = RelocateStepsModel.init().havingPassport
    var stepsCount = RelocateStepsModel.init().stepsCount
    var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
    var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    @BindableState var passport = PassportState()
    @BindableState var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    @BindableState var showingAlert = false

}
