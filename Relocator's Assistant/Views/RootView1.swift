////
////  ContentView.swift
////  Relocator's Assistant
////
////  Created by Александр on 06.11.22.
////
//
//import SwiftUI
//import ComposableArchitecture
//
//struct RootView: View {
//    let stateStore: Store<RootState, RootAction>
//    var body: some View {
//        WithViewStore(stateStore) { viewStore in
//            GeometryReader { geometry in
//                TabView {
//                    ZStack {
//                        RelocateStepsView(
//                            stateStore: stateStore.scope(
//                                state: \.relocateStepsState,
//                                action: RootAction.relocateStepsActions
//                            )
//                        )
//                    }
//                    .tabItem {
//                        Label("Шаги к переезду", systemImage: "figure.step.training")
//                    }
//                    ZStack {
//                        CountryDescriptionView(stateStore: stateStore.scope(
//                            state: \.countryDescriptionState,
//                             action: RootAction.countryDescriptionActions
//                          )
//                        )
//                    }
//                    .tabItem {
//                        Label("Описание страны", systemImage: "globe.desk")
//                    }
//                }
//
//            }
//
//
//            .tint(.red)
//
//
//        }
//    }
//}
//
//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView(stateStore: Store<RootState, RootAction>(initialState: RootState(), reducer: rootReducer,
//environment: RootEnvironment()))
//    }
//}
