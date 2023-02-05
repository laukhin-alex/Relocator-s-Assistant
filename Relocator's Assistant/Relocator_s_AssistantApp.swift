//
//  Relocator_s_AssistantApp.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture

@main
struct Relocator_s_AssistantApp: App {
    var body: some Scene {
        WindowGroup {
///        NavigationView {
            RootSharedView(store: .init(initialState: RootShared.State(), reducer: RootShared()))
//                RootView(store: .init(
//                    initialState: Root.State(),
//                    reducer: Root()
//                    )
//                )
            }
///        .navigationViewStyle(.stack)
///        }
    }
}
