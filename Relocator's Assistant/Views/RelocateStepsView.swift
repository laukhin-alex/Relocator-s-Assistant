//
//  RelocateStepsView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture


struct RelocateStepsView: View {

    
    let stateStore: Store<RelocateStepsState, RelocateStepsActions>

    var body: some View {
        WithViewStore(stateStore) { viewStore in
            NavigationView {
                List(0...viewStore.stepsCount, id: \.self) { index in
                    Toggle("У Вас есть Заграничный паспорт?", isOn: viewStore.binding(\.$havingPassport))
   
                    if  viewStore.havingPassport == true {
                        NavigationLink(destination: PassportView(stateStore: Store<PassportState, PassportActions>(
                            initialState: PassportState(), reducer: passportReducer,
                            environment: PassportEnvironment()
                        ), date: DateOfExpiryModal()),
                                       label: {
                            Text("Заграничный паспорт")
                        })

                    }
                    NavigationLink(destination: CountryDescriptionView(stateStore: Store<CountryDescriptionState, CountryDescriptionActions>(initialState:
                              CountryDescriptionState(),
                              reducer: countryDescriptionReducer,
                              environment: CountryDescriptionEnvironment())), label: {
                        Text("Выбранная страна")
                    })

                    .navigationTitle("План перезда")
                }
            }
        }
    }
}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RelocateStepsView(stateStore: Store<RelocateStepsState, RelocateStepsActions>(
            initialState: RelocateStepsState(), reducer: relocateStepsReducer,
            environment: RelocateStepsEnvironment()))
    }
}

