//
//  CountriesDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 15.02.23.
//
import ComposableArchitecture
import SwiftUI

struct CountriesDescription: ReducerProtocol {

    struct State: Equatable {
        
    }

    enum Action: Equatable {}

    var body: some ReducerProtocol<State, Action> {
        Reduce <State, Action> { state, action in
            switch action {
            default:
                return .none
            }
        }
    }

}

struct CountriesDescriptionView: View {
    let store: StoreOf<CountriesDescription>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct CountriesDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesDescriptionView(store: Store(
            initialState: CountriesDescription.State(),
            reducer: CountriesDescription()
            )
        )
    }
}
