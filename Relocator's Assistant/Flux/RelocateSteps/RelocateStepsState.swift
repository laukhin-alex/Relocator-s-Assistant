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
    var stepsCount = RelocateStepsModel.init().stepsCount
    @BindableState var passportCheckingState = PassportCheckingState()
}

