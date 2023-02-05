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
    }

    enum Action {
        case relocateSteps(RelocateSteps.Action)
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
                    ZStack {
                        EmptyView()
                        //                        RelocateStepsView(
                        //                            store: self.store.scope(
                        //                                state: \.relocateSteps,
                        //                                action: RootAction.relocateSteps
                        //                            )
                        //                        )
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

