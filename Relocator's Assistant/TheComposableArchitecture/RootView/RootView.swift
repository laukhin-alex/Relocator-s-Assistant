//
//  RootView.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//
import ComposableArchitecture
import SwiftUI


struct RootState: Equatable {
    var relocateSteps = RelocateStepsState()
}

enum RootAction {
    case relocateSteps(RelocateStepsAction)
}

struct RootEnvironment {}

let rootReducer = AnyReducer<RootState, RootAction, RootEnvironment>.combine(
    .init  { state, action, environment in
        switch action {
        default:
            return .none
        }
    },
    relocateStepsReducer
        .pullback(
            state: \.relocateSteps,
            action: /RootAction.relocateSteps,
            environment: { _ in .init() }
        )
)


struct RootView: View {
    let store: Store<RootState, RootAction>

    var body: some View {
        WithViewStore(store) { viewStore in
                TabView {
                    ZStack {
                        RelocateStepsView(
                            store: self.store.scope(
                                state: \.relocateSteps,
                                action: RootAction.relocateSteps
                            )
                        )
                    }
                    .tabItem {
                        Label("Шаги к переезду", systemImage: "figure.step.training")
                    }

                }
            }
            .navigationBarTitle("Шаги к переезду")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootView(store: .init(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment())
            )
        }
    }
}

