//
//  Passport.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI


// MARK: - Feature domain
 struct Passport: ReducerProtocol {
    struct State: Equatable {
        @BindableState var havingPassport = false

        var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    }

     enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

    }

     var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(\.$havingPassport):
                state.havingPassport = state.havingPassport
                if state.havingPassport {
                    state.chosenCountries = RelocateStepsModel.init().accessibleCountriesWithPassport
                } else {
                    state.chosenCountries = RelocateStepsModel.init().accessibleCountriesWithoutPassport
                }
                return .none

            case .binding:
                return .none
            }

        }
    }
}

// MARK: - Feature view
struct PassportView: View {
    let store: StoreOf<Passport>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Toggle("Есть паспорт?", isOn: viewStore.binding(\.$havingPassport))

            }
        }
        .navigationTitle("Настройка паспорта")
        .padding()
        Spacer()
    }
}

struct PassportView_Previews: PreviewProvider {
    static var previews: some View {
        PassportView(store: Store(
            initialState: Passport.State(),
            reducer: Passport()
            )
        )
    }
}
