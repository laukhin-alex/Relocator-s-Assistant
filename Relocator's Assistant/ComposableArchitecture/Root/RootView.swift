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
        var countriesDescription = CountriesDescription.State()
    }

    enum Action: Equatable {
        case personalData(PersonalData.Action)
        case countriesDescription(CountriesDescription.Action)
        case onAppear
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                state = .init()

                return .none
            case .personalData:
                return .none

            case .countriesDescription:
                return .none

            }
        }
        Scope(state: \.personalData, action: /Action.personalData) {
            PersonalData()
        }
        Scope(state: \.countriesDescription, action: /Action.countriesDescription) {
            CountriesDescription()
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
                                EmptyView()
                            }
                            .tabItem {
                                Label("Главная", systemImage: "house")
                            }
                            ZStack {
                                PersonalDataView(store: self.store.scope(
                                    state: \.personalData,
                                    action: Root.Action.personalData
                                    )
                                )
                            }
                            .tabItem {
                                Label("Настройка", systemImage: "person.3")
                            }
                            
                            ZStack {
                                CountriesDescriptionView(store: self.store.scope(
                                    state: \.countriesDescription,
                                    action: Root.Action.countriesDescription
                                    )
                                )
                            }
                            .tabItem {
                                Label("Страны", systemImage: "globe.europe.africa")
                            }
                            
                            ZStack {
                                EmptyView()
                            }
                            .tabItem {
                                Label("Переезд", systemImage: "doc.richtext")
                            }
                            
                        }
                    }
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                    appearance.backgroundColor = UIColor(Color.blue.opacity(0.2))
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
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
