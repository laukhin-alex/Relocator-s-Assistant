//
//  ChoosingCountryView.swift
//  Relocator's Assistant
//
//  Created by Александр on 26.11.22.
//

import SwiftUI
import ComposableArchitecture

struct ChoosingCountryView: View {
    let stateStore: Store<ChoosingCountryState, ChoosingCountryActions>
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader {_ in
                ScrollView {
                    VStack{
                        Text(viewStore.chosenCountryName)
                            .font(.system(size: 200))
                        Text(viewStore.chosenCountryName)
                            .fontWeight(.regular)
                            .foregroundColor(.red)
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)


//                        Spacer()
                        Text(viewStore.choseCountryDescription)
                            .multilineTextAlignment(.leading)
                            .padding(.all)


//                        Spacer(minLength: 500)
                    }
                    .padding([.top, .leading])
                }
//                .onAppear {
//                    viewStore.send(.selectCountry(ChoosingCountryState(chosenCountry: CountryDescriptionState())))
//                }
            }
        }

    }
}

struct ChoosingCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosingCountryView(stateStore: Store<ChoosingCountryState, ChoosingCountryActions>(initialState: ChoosingCountryState(),
                                                                                                  reducer: choosingCountryReducer,
                                                                                                  environment: ChoosingCountryEnvironment()))
    }
}
