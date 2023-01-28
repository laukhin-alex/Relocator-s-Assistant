//
//  RelocateSteps.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI

struct RelocateStepsState: Equatable {
    var count = 1
}

enum RelocateStepsAction {
    case one
    case two
}

struct RelocateStepsEnvironment {}

let relocateStepsReducer = AnyReducer<RelocateStepsState, RelocateStepsAction, RelocateStepsEnvironment> { state, action, environment in
    switch action {
    case .one:
        return .none
    case .two:
        return .none
    }
}

struct RelocateStepsView: View {
    let store: Store<RelocateStepsState, RelocateStepsAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
                Form {
                    Section(header: Text("Проверка паспорта")) {
                        NavigationLink(
                            "Определимся с Заграничным паспортом",
                            destination:
                                EmptyView()
                        )
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
            .navigationBarTitle("Шаги к переезду")
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
    }
}

