//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Feature domain
struct PassportChecking: ReducerProtocol {
    struct State: Equatable {
        var passport = Passport.State()
        var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
        var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
        var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    }

    enum Action: Equatable {
        case passport(Passport.Action)
        case chosenCountries

    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .chosenCountries:
                if state.passport.havingPassport {
                    state.chosenCountries = state.accessibleCountriesWithPassport
                    return .none
                } else {
                    state.chosenCountries = state.accessibleCountriesWithoutPassport
                    return .none
                }
            case .passport:
                return .none
            }
        }
        Scope(state: \.passport, action: /Action.passport) {
            Passport()
        }._printChanges()
    }
}

// MARK: - Feature view
struct PassportCheckingView: View {
    let store: StoreOf<PassportChecking>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Form {
                    Section(header: Text("Заграничный паспорт")) {
                        NavigationLink(
                            "Определимся с Заграничным паспортом",
                            destination:
                                PassportView(store: self.store.scope(
                                    state: \.passport,
                                    action: PassportChecking.Action.passport
                                    )
                                )
                        )
                    }

                    Section(header: Text("Доступные страны")) {
                        VStack {
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
            .navigationBarTitle("Паспорт")
            .onAppear { viewStore.send(.chosenCountries) }
        }
    }
}

struct PassportCheckingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PassportCheckingView(store: Store(
                initialState: PassportChecking.State(),
                reducer: PassportChecking()
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}
