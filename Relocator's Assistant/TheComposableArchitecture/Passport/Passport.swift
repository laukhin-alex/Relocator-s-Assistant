//
//  Passport.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct PassportState: Equatable {
    @BindableState var havingPassport = false

}

enum PassportAction: BindableAction, Equatable {
    case binding(BindingAction<PassportState>)
}

struct PassportEnvironment {}

let passportReducer = AnyReducer<PassportState, PassportAction, PassportEnvironment> { state, action, environment in

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

struct PassportView: View {
    let store: Store<PassportState,PassportAction>

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

struct PassportView_Previews: PreviewProvider {
    static var previews: some View {
        PassportView(store: Store(
            initialState: PassportState(),
            reducer: passportReducer,
            environment: PassportEnvironment()
            )
        )
    }
}
