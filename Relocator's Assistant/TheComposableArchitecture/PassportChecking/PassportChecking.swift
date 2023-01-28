//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct PassportCheckingState: Equatable {
    @BindableState var havingPassport = false
}

enum PassportCheckingAction: BindableAction, Equatable {
    case binding(BindingAction<PassportCheckingState>)
}

struct PassportCheckingEnvironment {}

let passportCheckingReducer = AnyReducer<PassportCheckingState, PassportCheckingAction, PassportCheckingEnvironment> { state, action, environment in

    switch action {
    case .binding(\.$havingPassport):
        state.havingPassport = state.havingPassport
        return .none

    case .binding:
        return .none
    }

}
.binding()
.debug()

struct PassportCheckingView: View {
    let store: Store<PassportCheckingState,PassportCheckingAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Toggle("Есть паспорт?", isOn: viewStore.$havingPassport)
            }
            .padding()
            Spacer()
        }
    }
}

struct PassportCheckingView_Previews: PreviewProvider {
    static var previews: some View {
        PassportCheckingView(store: Store(
            initialState: PassportCheckingState(),
            reducer: passportCheckingReducer,
            environment: PassportCheckingEnvironment()
            )
        )
    }
}
