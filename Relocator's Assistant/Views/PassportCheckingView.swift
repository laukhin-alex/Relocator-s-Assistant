//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 24.11.22.
//

import SwiftUI
import ComposableArchitecture

struct PassportCheckingView: View {
    var stateStore: Store<PassportCheckingState, PassportCheckingActions>
    var body: some View {
        let _ = print("view rebilded")
        WithViewStore(stateStore) { viewStore in
            GeometryReader {_ in
                ZStack{
                    List {


                        Section(header: Text("Заграничный паспорт")) {
                            VStack {
                                Toggle("У Вас есть Заграничный паспорт, или Вы хотите оформить его в ближайшее время?", isOn: viewStore.binding(\.$havingPassport))
                                if  viewStore.havingPassport == true {
                                    HStack {
                                        Image(systemName: viewStore.passportState.dateOfExpiryMoreThanHalfYear ? "checkmark.square.fill" : "square")
                                            .foregroundColor(viewStore.passportState.dateOfExpiryMoreThanHalfYear ? Color(UIColor.systemBlue) : Color.secondary)


                                    NavigationLink("Настройка паспорта", destination:   PassportView(stateStore: stateStore.scope(
                                        state: \.passportState,
                                        action: PassportCheckingActions.passportAction
                                    ),  date: DateOfExpiryModal()
                                                                                                         //                                                       label: {
                                                                                                         //                                            Text("Настройка паспорта")

                                        )
                                        )
                                    }
                                }
                            }

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
                                    .onTapGesture {
                                        viewStore.send(.selectCountry(country))
                                    }

                                }
                            }



                            //                        }
                        }
                    }

                    IfLetStore(
                        stateStore.scope(
                            state: \.choosingCountryState,
                            action: PassportCheckingActions.choosingCountryActions)) { countryDescription in
                                ChoosingCountryView(stateStore: countryDescription)
                            }
                    .onAppear {
                        viewStore.send(.onAppear(PassportActions.onAppear))
                    }
                    .navigationTitle("Настройка")
                }

            }
        }
    }
}

struct PassportCheckingView_Previews: PreviewProvider {
    static var previews: some View {
        PassportCheckingView(stateStore: Store<PassportCheckingState, PassportCheckingActions>(
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
