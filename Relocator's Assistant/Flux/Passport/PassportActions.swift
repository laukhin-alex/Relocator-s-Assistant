//
//  PassportActions.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.11.22.
//

import Foundation
import ComposableArchitecture

enum PassportActions: BindableAction, Equatable {

    case binding(BindingAction<PassportState>)
    case dateChanged(Date)
    case onAppear

}
