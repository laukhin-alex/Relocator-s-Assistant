//
//  RootView.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//
import ComposableArchitecture
import SwiftUI


// MARK: - Root domain, conformed to ReducerProtocol
struct Root: ReducerProtocol {
    struct State: Equatable {
        var relocateSteps = RelocateSteps.State()
        var chosenCountry: ChosenCountry.State {
            get {
                ChosenCountry.State(
                    havingPassport: self.relocateSteps.passportChecking.passport.havingPassport,
                    chosenCountries: self.relocateSteps.passportChecking.passport.chosenCountries

                )
            }
            set {
                self.relocateSteps.passportChecking.passport.havingPassport = newValue.havingPassport
                self.relocateSteps.passportChecking.passport.chosenCountries = newValue.chosenCountries
            }
        }
    }

    enum Action {
        case relocateSteps(RelocateSteps.Action)
        case chosenCountry(ChosenCountry.Action)
        case onAppear
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
                return .none

            default:
                return .none
            }
        }
        Scope(state: \.relocateSteps, action: /Action.relocateSteps) {
            RelocateSteps()
        }
        Scope(state: \.chosenCountry, action: /Action.chosenCountry) {
            ChosenCountry()
        }
    }
}


// MARK: - Root view, conformed to ReducerProtocol
struct RootView: View {
    let store: StoreOf<Root>

    var body: some View {
        WithViewStore(store) { viewStore in
//            NavigationView {
            TabView {

                VStack {
                    NavigationView {
                        RelocateStepsView(
                            store: self.store.scope(
                                state: \.relocateSteps,
                                action: Root.Action.relocateSteps
                            )
                        )
                    }
                            .navigationViewStyle(.stack)

                }
                    .tabItem {
                        Label("Шаги к переезду", systemImage: "figure.step.training")
                    }
                    VStack {
                        ChosenCountryView(store: self.store.scope(state: \.chosenCountry, action: Root.Action.chosenCountry
                            )
                        )
                    }
                    .tabItem {
                        Label("Шаги к переездуg", systemImage: "figure.step.training")
                    }
                }
            }
        
//        .navigationBarTitle("План переезда")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootView(store: .init(
                initialState: Root.State(),
                reducer: Root()
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}

