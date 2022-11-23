//
//  ContentView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let stateStore: Store<RootState, RootAction>
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader { geometry in
                TabView {
                    ZStack {
                        RelocateStepsView(stateStore: Store<RelocateStepsState, RelocateStepsActions>(
                            initialState: RelocateStepsState(), reducer: relocateStepsReducer,
                            environment: RelocateStepsEnvironment()))

                    }
                    .tabItem {
                        Label("Шаги к переезду", systemImage: "figure.step.training")
                    }
                    CountryDescriptionView(stateStore: Store<CountryDescriptionState, CountryDescriptionActions>(initialState: CountryDescriptionState(),
                        reducer: countryDescriptionReducer,
                        environment: CountryDescriptionEnvironment()))
                    .tabItem {
                        Label("Описание страны", systemImage: "globe.desk")
                    }
                }
            }

            .edgesIgnoringSafeArea(.bottom)
            .tint(.red)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(stateStore: Store<RootState, RootAction>(initialState: RootState(), reducer: rootReducer,
environment: RootEnvironment()))
    }
}
