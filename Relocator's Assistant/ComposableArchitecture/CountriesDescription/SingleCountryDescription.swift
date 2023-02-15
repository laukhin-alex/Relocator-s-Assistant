//
//  SingleCountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 15.02.23.
//

import ComposableArchitecture
import SwiftUI

struct SingleCountryDescription: ReducerProtocol {
    struct State: Equatable {}

    enum Action: Equatable {}

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        default:
            return .none
        }
    }
}

struct SingleCountryDescriptionView: View {
    let store: StoreOf<SingleCountryDescription>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SingleCountryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCountryDescriptionView(store: Store(
            initialState: SingleCountryDescription.State(),
            reducer: SingleCountryDescription()
            )
        )
    }
}
