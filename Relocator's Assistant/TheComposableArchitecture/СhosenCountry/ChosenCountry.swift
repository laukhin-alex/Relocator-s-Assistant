//
//  ChosenCountry.swift
//  Relocator's Assistant
//
//  Created by Александр on 04.02.23.


import ComposableArchitecture
import SwiftUI

struct ChosenCountry: ReducerProtocol {
    struct State: Equatable {
        static func == (lhs: ChosenCountry.State, rhs: ChosenCountry.State) -> Bool {
            return lhs.newCountries == rhs.newCountries
        }
// MARK: - тут работает сеттер из экрана с паспортом
        
        private(set) var havingPassport: Bool
        private(set) var chosenCountries: [CountryModel]
// MARK: - Не работает ни обертка свойств ни просто обычные свойства - экран не меняется
        var newPassport = false
        @Countries var newCountries: [CountryModel]
        var passport = Passport.State()

    }

    enum Action: Equatable {
        case chosenCountry
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .chosenCountry:


//            state.newPassport = state.havingPassport
//            state.newCountries = state.chosenCountries
            if state.passport.havingPassport {
                state.newCountries = RelocateStepsModel.init().accessibleCountriesWithPassport
            } else {
                state.newCountries = RelocateStepsModel.init().accessibleCountriesWithoutPassport
            }
            return .none
        }
    }
}

struct ChosenCountryView: View {
    let store: StoreOf<ChosenCountry>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in

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
                            Section(header: Text("Проба")) {
                                VStack {
                                    Button(action: {

                                        viewStore.send(.chosenCountry)
                                    }) {
                                        Text("Placeholder")
                                            .foregroundColor(.white)
                                            .padding()
                                            .padding(.horizontal)
                                            .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    }
                                    ForEach(viewStore.newCountries) {
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
            
            .onAppear { viewStore.send(.chosenCountry)}
        }
    }
}

struct ChosenCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenCountryView(store: Store(
            initialState: ChosenCountry.State(havingPassport: true, chosenCountries: RelocateStepsModel.init().accessibleCountriesWithPassport),
            reducer: ChosenCountry()
        )
        )
    }
}
