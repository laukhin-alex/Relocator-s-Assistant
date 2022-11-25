//
//  PassportCheckingActions.swift
//  Relocator's Assistant
//
//  Created by Александр on 25.11.22.
//

import Foundation
import ComposableArchitecture

enum PassportCheckingActions: BindableAction {
    case binding(BindingAction<PassportCheckingState>)
}
