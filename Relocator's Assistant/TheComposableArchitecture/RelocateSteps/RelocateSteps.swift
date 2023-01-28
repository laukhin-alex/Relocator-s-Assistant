//
//  RelocateSteps.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct RelocateStepsState: Equatable {
    var count = 1
}

enum RelocateStepsAction {
    case one
    case two
}

struct RelocateStepsEnvironment {}

let relocateStepsReducer = AnyReducer<RelocateStepsState, RelocateStepsAction, RelocateStepsEnvironment> { state, action, environment in
    switch action {
    case .one:
        return .none
    case .two:
        return .none
    }
}

struct RelocateSteps: View {
    let store: Store<RelocateStepsState, RelocateStepsAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RelocateSteps_Previews: PreviewProvider {
    static var previews: some View {
        RelocateSteps(store: Store(
            initialState: RelocateStepsState(),
            reducer: relocateStepsReducer,
            environment: RelocateStepsEnvironment()
            )
        )
    }
}
