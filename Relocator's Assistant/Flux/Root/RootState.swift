//
//  RootState.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture


struct RootState {
    var relocateStepsState = RelocateStepsState()
    var countryDescriptionState = CountryDescriptionState()
}
