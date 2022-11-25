//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 24.11.22.
//

import SwiftUI
import ComposableArchitecture

struct PassportChecking: View {
    var stateStore: Store<PassportCheckingState, PassportCheckingActions>
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader {_ in
                ZStack {
                    Form {
                        Section(header: Text("Заграничный паспорт")) {
                            VStack {
                                Toggle("У Вас есть Заграничный паспорт, или Вы хотите оформить его в ближайшее время?", isOn: viewStore.binding(\.relocateStepsState.$havingPassport))

                                if  viewStore.relocateStepsState.havingPassport == true {
                                    NavigationLink(destination: PassportView(stateStore: Store<PassportState, PassportActions>(
                                        initialState: PassportState(), reducer: passportReducer,
                                        environment: PassportEnvironment()
                                    ), date: DateOfExpiryModal()),
                                                   label: {
                                        Text("Настройка паспорта")
                                    })
                                }
                            }
                        }
                        Section(header: Text("Доступные страны")) {
                            VStack {
                                List{
                                    ForEach(viewStore.relocateStepsState.chosenCountries) {
                                        name in
                                        
                                        NavigationLink(destination: CountryDescriptionView(stateStore: Store<CountryDescriptionState, CountryDescriptionActions>(initialState:
                                                                                                                                                                    CountryDescriptionState(),
                                                                                                                                                                 reducer: countryDescriptionReducer,
                                                                                                                                                                 environment: CountryDescriptionEnvironment())), label: {
                                            HStack {
                                                Text(name.flag)
                                                    .padding(.all)

                                                Spacer()
                                                Text(name.countryName)
                                                Spacer()
                                            }
                                        })
                                    }
                                

                                }
                            }
                        }
                    }
                }
                .navigationTitle("Настройка")
            }
        }
    }
}

struct PassportChecking_Previews: PreviewProvider {
    static var previews: some View {
        PassportChecking(stateStore: Store<PassportCheckingState, PassportCheckingActions>(
            initialState: PassportCheckingState(), reducer: passportCheckingReducer,
            environment: PassportCheckingEnvironment()))
    }
}
