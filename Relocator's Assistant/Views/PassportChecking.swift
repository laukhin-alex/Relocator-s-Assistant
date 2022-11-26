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
                                    HStack {
                                        Image(systemName: viewStore.relocateStepsState.passport.dateOfExpiryMoreThanHalfYear ? "checkmark.square.fill" : "square")
                                            .foregroundColor(viewStore.relocateStepsState.passport.dateOfExpiryMoreThanHalfYear ? Color(UIColor.systemBlue) : Color.secondary)
                                            
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
                        }
                        Section(header: Text("Доступные страны")) {
                            ZStack {
                                VStack {
                                    List{
                                        ForEach(viewStore.relocateStepsState.chosenCountries) {
                                            country in
                                            HStack {
                                                Text(country.flag)
                                                    .padding(.all)

                                                Spacer()
                                                Text(country.countryName)
                                                Spacer()
                                            }
                                            .onTapGesture {
                                                viewStore.send(.selectCountry(country))
                                            }

                                        }
                                    }
                                    IfLetStore(
                                        stateStore.scope(
                                            state: \.countryDescriptionState,
                                            action: PassportCheckingActions.choosingCountryActions)) { countryDescription in
                                                ChoosingCountryView(stateStore: Store(initialState: ChoosingCountryState(), reducer: choosingCountryReducer, environment: ChoosingCountryEnvironment()))
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


//                                        NavigationLink(destination: CountryDescriptionView(stateStore: Store<CountryDescriptionState, CountryDescriptionActions>(initialState:
//                                                CountryDescriptionState(),
//                                                reducer: countryDescriptionReducer,
//                                                environment: CountryDescriptionEnvironment())), label: {
//                                            HStack {
//                                                Text(country.flag)
//                                                    .padding(.all)
//
//                                                Spacer()
//                                                Text(country.countryName)
//                                                Spacer()
//                                            }
//                                        })
