//
//  RootView.swift
//  Relocator's Assistant
//
//  Created by Александр on 28.01.23.
//
import ComposableArchitecture
import SwiftUI


struct RootState {
//    var
}

enum RootAction {}

struct RootEnvironment {}

let rootReducer = AnyReducer<RootState, RootAction, RootEnvironment> { state, action, environment in
    switch action {
    default:
        return .none
    }
}
/*
struct RootView: View {
    let store: Store<RootState, RootAction>

    var body: some View {
        NavigationView{
            WithViewStore(self.store) { viewStore in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: .init(
            initialState: RootState(),
            reducer: rootReducer,
            environment: RootEnvironment())
        )
    }
}
*/
