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
        var passport = Passport.State()
        var havingPassport: Bool {
            get {
                passport.havingPassport
            }
            set {
                self.passport.havingPassport = newValue
            }
        }

        var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
        var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
        var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport

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
            VStack {
                Form {
                    Section(header: Text("Доступные страны")) {
                        VStack {
                            NavigationLink("fff") {
                                PassportView(store: self.store.scope(state: \.passport, action: ChosenCountry.Action.passport))
                            }
                            ForEach(viewStore.chosenCountries) {
                                country in
                                HStack {
                                    Text(country.flag)
                                        .padding(.all)

                                    Spacer()
                                    Text(country.countryName)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
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
