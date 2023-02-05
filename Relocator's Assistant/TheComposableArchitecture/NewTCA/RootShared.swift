//
//  RootShared.swift
//  Relocator's Assistant
//
//  Created by Александр on 05.02.23.
//


import ComposableArchitecture
import SwiftUI

struct RootShared: ReducerProtocol {
    enum Tab { case relocatePassport, country}

    struct State: Equatable {
        var currentTab = Tab.relocatePassport
        var relocatePassport = RelocatePassport.State()
        var country: Country.State {
            get {
                Country.State(
                    havingPassport: self.relocatePassport.passport.havingPassport
                )
            }
            set {
                self.relocatePassport.passport.havingPassport = newValue.havingPassport
            }
        }
    }

    enum Action: Equatable {
        case relocatePassport(RelocatePassport.Action)
        case country(Country.Action)
        case selectTab(Tab)
    }

    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.relocatePassport, action: /Action.relocatePassport) {
            RelocatePassport()
        }

        Scope(state: \.country, action: /Action.country) {
            Country()
        }
        Reduce { state, action in
            switch action {
            case .relocatePassport, .country:
                return .none
            case let .selectTab(tab):
                state.currentTab = tab
                return .none
            }
        }._printChanges()
    }

    struct RelocatePassport: ReducerProtocol {
        struct State: Equatable {
            var passport = Passport.State()
        }

        enum Action: Equatable {
            case passport(Passport.Action)
        }

        var body: some ReducerProtocol<State , Action> {
            Scope(state: \.passport, action: /Action.passport) {
                Passport()
            }
            Reduce { state, action in
                switch action {
                case .passport:
                    return .none
                }
            }
        }
    }

    struct Country: ReducerProtocol {
        struct State: Equatable {
            private(set) var havingPassport: Bool

            var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
            var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
            var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
        }

        enum Action: Equatable {
            case chosenCountry
        }

        func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
            switch action {
            case .chosenCountry:
                if state.havingPassport {
                    state.chosenCountries = state.accessibleCountriesWithPassport
                    return .none
                } else  {
                    state.chosenCountries = state.accessibleCountriesWithoutPassport
                    return .none
                }
            }
        }
    }
}

struct RootSharedView: View {
    let store: StoreOf<RootShared>

    var body: some View {
        WithViewStore(self.store, observe: \.currentTab) { viewStore in

                TabView {
                    NavigationView {
                    VStack {
                        RelocatePassportView(
                            store: self.store.scope(
                                state: \.relocatePassport,
                                action: RootShared.Action.relocatePassport
                            )
                        )
                    }
                }
                .tabItem {
                    Label("Шаги к переезду", systemImage: "figure.step.training")
                }
                ZStack {
                    CountryView(store: self.store.scope(state: \.country, action: RootShared.Action.country
                        )
                    )
                }
                .tabItem {
                    Label("Шаги к переездуg", systemImage: "figure.step.training")
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarTitle("План переезда")
    }
}

struct RelocatePassportView: View {
    let store: StoreOf<RootShared.RelocatePassport>

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
                                    action: RootShared.RelocatePassport.Action.passport
                                )
                                )
                        )
                    }
                    .navigationBarTitle("Паспорт")
//                    .onAppear { viewStore.send(.passport) }
                }
            }
        }
    }
}


struct CountryView: View {
    let store: StoreOf<RootShared.Country>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Form {
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
        .onAppear { viewStore.send(.chosenCountry)}
        }
    }
}

struct RootSharedView_Previews: PreviewProvider {
    static var previews: some View {
        RootSharedView(store:
                        Store(
                            initialState: RootShared.State(),
                            reducer: RootShared()
                        )
            )
    }
}
