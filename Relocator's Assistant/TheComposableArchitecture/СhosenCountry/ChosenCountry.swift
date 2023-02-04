//
//  ChosenCountry.swift
//  Relocator's Assistant
//
//  Created by Александр on 04.02.23.
//

import ComposableArchitecture
import SwiftUI

struct ChosenCountry: ReducerProtocol {
    struct State: Equatable {
        var havingPassport = false
        var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
        var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
        var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
        var passport: Passport.State {
            get {
                .init(havingPassport: self.havingPassport)
            }
            set {
                self.havingPassport = newValue.havingPassport
            }
        }
    }
    enum Action {
        case passport(Passport.Action)
        case chosenCountry
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .passport:
                return .none
            case .chosenCountry:
                if state.havingPassport {
                    state.chosenCountries = state.accessibleCountriesWithPassport
                    return .none
                } else {
                    state.chosenCountries = state.accessibleCountriesWithoutPassport
                    return .none
                }
            }
        }
        Scope(state: \.passport, action: /Action.passport) {
            Passport()
        }
    }
}

struct ChosenCountryView: View {
    let store: StoreOf<ChosenCountry>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
        
                .onAppear { viewStore.send(.chosenCountry)}
        }
    }
}

struct ChosenCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenCountryView(store: Store(
            initialState: ChosenCountry.State(),
            reducer: ChosenCountry()
            )
        )
    }
}
