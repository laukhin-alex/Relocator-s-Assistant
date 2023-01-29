//
//  RelocateSteps.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct RelocateStepsState: Equatable {
    var passportCheckingState = PassportCheckingState()
}

enum RelocateStepsAction {
    case passportCheckingAction(PassportCheckingAction)
}

struct RelocateStepsEnvironment {}

let relocateStepsReducer = AnyReducer<RelocateStepsState, RelocateStepsAction, RelocateStepsEnvironment>.combine(
    .init  { state, action, environment in
        switch action {
        default:
            return .none
        }
    },
    passportCheckingReducer
        .pullback(
            state: \.passportCheckingState,
            action: /RelocateStepsAction.passportCheckingAction,
            environment: { _ in .init() }
        )
)

struct RelocateStepsView: View {
    let store: Store<RelocateStepsState, RelocateStepsAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            Form {
                Section(header: Text("Проверка паспорта")) {
                    HStack {
                        Image(systemName: viewStore.passportCheckingState.passportState.havingPassport ? "checkmark.square.fill" : "square")
                            .foregroundColor(viewStore.passportCheckingState.passportState.havingPassport ? Color(UIColor.systemBlue) : Color.secondary)

                        NavigationLink(
                            "Определимся с Заграничным паспортом",
                            destination:
                                PassportCheckingView(store: store.scope(
                                    state: \.passportCheckingState,
                                    action: RelocateStepsAction.passportCheckingAction
                                )
                                )
                        )
                    }
                }
                Section(header: Text("Выбранная страна")) {
                    NavigationLink(
                        "Выбранная страна",
                        destination:
                            EmptyView()
                    )
                }
            }
            Spacer()
        }
        
    }
}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RelocateStepsView(store: Store(
                initialState: RelocateStepsState(),
                reducer: relocateStepsReducer,
                environment: RelocateStepsEnvironment()
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}

