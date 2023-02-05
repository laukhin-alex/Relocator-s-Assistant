//
//  RelocateSteps.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//

import ComposableArchitecture
import SwiftUI


struct RelocateSteps: ReducerProtocol {
    struct State: Equatable {
        var passportChecking = PassportChecking.State()
        var chosenCountry = ChosenCountry.State()
    }

    enum Action {
        case passportChecking(PassportChecking.Action)
        case chosenCountry(ChosenCountry.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .passportChecking:
                return .none
            case .chosenCountry:
                return .none
            }
        }
        Scope(state: \.passportChecking, action: /Action.passportChecking) {
            PassportChecking()
        }
        Scope(state: \.chosenCountry, action: /Action.chosenCountry) {
            ChosenCountry()
        }
    }
}


struct RelocateStepsView: View {
    let store: StoreOf<RelocateSteps>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
                Form {
                    Section(header: Text("Проверка паспорта")) {
                        HStack {
                            Image(systemName: viewStore.passportChecking.passport.havingPassport ? "checkmark.square.fill" : "square")
                                .foregroundColor(viewStore.passportChecking.passport.havingPassport ? Color(UIColor.systemBlue) : Color.secondary)

                            NavigationLink(
                                "Определимся с Заграничным паспортом",
                                destination:
                                    PassportCheckingView(store: self.store.scope(
                                        state: \.passportChecking,
                                        action: RelocateSteps.Action.passportChecking
                                    )
                                    )
                            )
                        }
                    }
                    Section(header: Text("Выбранная страна")) {
                        NavigationLink(
                            "Выбранная страна",
                            destination:
                                ChosenCountryView(store: self.store.scope(
                                    state: \.chosenCountry,
                                    action: RelocateSteps.Action.chosenCountry
                                )
                                )
                        )
                    }
                }
                Spacer()
            }


                .navigationBarTitle("План переезда")

    }
}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RelocateStepsView(store: Store(
                initialState: RelocateSteps.State(),
                reducer: RelocateSteps()
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}

