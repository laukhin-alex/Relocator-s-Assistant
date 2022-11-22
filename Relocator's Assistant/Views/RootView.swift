//
//  ContentView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {

    @State var tabSelection: Int = 0

    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                ZStack {
                    RelocateStepsView(stateStore: Store<RelocateStepsState, RelocateStepsActions>(
                        initialState: RelocateStepsState(), reducer: RelocateStepsReducer,
                        environment: RelocateStepsEnvironment()))

                }
                .tag(0)
                .tabItem {
                    Label("Шаги к переезду", systemImage: "figure.step.training")
                }
                CountryDescriptionView()
                    .tag(1)
                    .tabItem {
                        Label("Описание страны", systemImage: "globe.desk")
                    }
            }
        }

        .edgesIgnoringSafeArea(.bottom)
        .tint(.red)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
