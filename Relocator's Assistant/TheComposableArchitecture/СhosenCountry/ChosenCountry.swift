//
//  ChosenCountry.swift
//  Relocator's Assistant
//
//  Created by Александр on 04.02.23.


import ComposableArchitecture
import SwiftUI

struct ChosenCountry: ReducerProtocol {
    struct State: Equatable {
        private(set) var havingPassport: Bool
        private(set) var chosenCountries: [CountryModel]
    }

    enum Action: Equatable {
        case chosenCountry
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .chosenCountry:
            return .none
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
            initialState: ChosenCountry.State(havingPassport: true, chosenCountries: RelocateStepsModel.init().accessibleCountriesWithPassport),
            reducer: ChosenCountry()
        )
        )
    }
}
