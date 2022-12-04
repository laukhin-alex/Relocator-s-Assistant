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
            RootView(stateStore: Store<RootState, RootAction>(initialState:
                                                                RootState(),
                                                                reducer: rootReducer,
                                                                environment: RootEnvironment()))
        }
    }
}
