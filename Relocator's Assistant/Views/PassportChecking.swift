//
//  PassportChecking.swift
//  Relocator's Assistant
//
//  Created by Александр on 24.11.22.
//

import SwiftUI
import ComposableArchitecture

struct PassportChecking: View {
    var stateStore: Store<RelocateStepsState, RelocateStepsActions>
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader {_ in
                ZStack {
                Form {
                    Section(header: Text("Заграничный паспорт")) {
                        VStack {
                            Toggle("У Вас есть Заграничный паспорт, или Вы хотите оформить его в ближайшее время?", isOn: viewStore.binding(\.$havingPassport))

                            if  viewStore.havingPassport == true {
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
                                ForEach(viewStore.chosenCountries) {
                                    name in
                                    HStack {
                                        Text(name.flag)
                                            .padding(.all)
                                        
                                        Spacer()
                                        Text(name.countryName)
                                        Spacer()
                                    }
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
        PassportChecking(stateStore: Store<RelocateStepsState, RelocateStepsActions>(
            initialState: RelocateStepsState(), reducer: relocateStepsReducer,
            environment: RelocateStepsEnvironment()))
    }
}
