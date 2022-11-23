//
//  RootReducer.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation
import ComposableArchitecture

let rootReducer = AnyReducer<
    RootState,
    RootAction,
    RootEnvironment> .combine(
        relocateStepsReducer.pullback(
            state: \.relocateStepsState,
            action: /RootAction.relocateStepsActions,
            environment: \.relocateStepsEnvironment

        ),
        countryDescriptionReducer.pullback(
            state: \.countryDescriptionState,
            action: /RootAction.countryDescriptionActions,
            environment: \.countryDescriptionEnvironment
        )
    )
