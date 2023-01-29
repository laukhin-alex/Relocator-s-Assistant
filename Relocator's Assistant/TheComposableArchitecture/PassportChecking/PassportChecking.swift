//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct PassportCheckingState: Equatable {
    var passportState = PassportState()
    var accessibleCountriesWithPassport = RelocateStepsModel.init().accessibleCountriesWithPassport
    var accessibleCountriesWithoutPassport = RelocateStepsModel.init().accessibleCountriesWithoutPassport
    var chosenCountries: [CountryModel] = RelocateStepsModel.init().accessibleCountriesWithoutPassport
}

enum PassportCheckingAction: Equatable {
    case passportAction(PassportAction)
    case chosenCountries

}

struct PassportCheckingEnvironment {}

let passportCheckingReducer = AnyReducer<PassportCheckingState, PassportCheckingAction, PassportCheckingEnvironment>.combine(
    .init { state, action, environment in

        switch action {
        case .chosenCountries:
            if state.passportState.havingPassport {
                state.chosenCountries = state.accessibleCountriesWithPassport
                return .none
            } else {
                state.chosenCountries = state.accessibleCountriesWithoutPassport
                return .none
            }
        case .passportAction(_):
            return .none
        }

},
passportReducer
        .pullback(
            state: \.passportState,
            action: /PassportCheckingAction.passportAction,
            environment: { _ in .init() }
    )
    )
.debug()


struct PassportCheckingView: View {
    let store: Store<PassportCheckingState,PassportCheckingAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
//            NavigationView {
                VStack {
                    Form {
                        Section(header: Text("Заграничный паспорт")) {
                            NavigationLink(
                                "Определимся с Заграничным паспортом",
                                destination:
                                    PassportView(store: store.scope(
                                        state: \.passportState,
                                        action: PassportCheckingAction.passportAction
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
                .onAppear {
                    viewStore.send(.chosenCountries)
                }
//            }
                .navigationBarTitle("Паспорт")
                
        }        
    }

}

struct PassportCheckingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PassportCheckingView(store: Store(
                initialState: PassportCheckingState(),
                reducer: passportCheckingReducer,
                environment: PassportCheckingEnvironment()
            )
            )
        }
        .navigationViewStyle(.stack)
    }
}
