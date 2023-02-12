//
//  RootView.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.02.23.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Root domain, conformed to ReducerProtocol
struct Root: ReducerProtocol {
    struct State: Equatable {
        var personalData = PersonalData.State()
    }

    enum Action: Equatable {
        case personalData(PersonalData.Action)
        case onAppear
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
                return .none
            case .personalData:
                return .none

            }
        }
        Scope(state: \.personalData, action: /Action.personalData) {
            PersonalData()
        }

        ._printChanges()
    }
}

// MARK: - Root view, conformed to ReducerProtocol
struct RootView: View {
    let store: StoreOf<Root>

    var body: some View {
            WithViewStore(store) { viewStore in
                NavigationView {
                ZStack {
                    TabView {
                            ZStack {
                                PersonalDataView(store: self.store.scope(
                                    state: \.personalData,
                                    action: Root.Action.personalData
                                    )
                                )
                            }
                            .tabItem {
                                Label("Процесс переезда", systemImage: "house")
                            }
                            
                            ZStack {
                                EmptyView()
                            }
                            .tabItem {
                                Label("Персональные данные", systemImage: "person.3")
                            }
                            
                            ZStack {
                                EmptyView()
                            }
                            .tabItem {
                                Label("Выбор страны", systemImage: "globe.europe.africa")
                            }
                            
                            ZStack {
                                EmptyView()
                            }
                            .tabItem {
                                Label("Шаги к переезду", systemImage: "doc.richtext")
                            }
                            
                        }
                    }

            }
        }
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
