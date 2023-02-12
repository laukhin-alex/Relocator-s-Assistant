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
        var personalData = ""
    }

    enum Action {
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

    }
}

// MARK: - Root view, conformed to ReducerProtocol
struct RootView: View {
    let store: StoreOf<Root>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                NavigationView {
                    TabView {
                        ZStack {
                            EmptyView()
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
//                .padding()
                .navigationViewStyle(.stack)
                .navigationBarTitle("Заглушка")
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
