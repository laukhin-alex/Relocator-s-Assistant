//
//  CountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture

struct CountryDescriptionView: View {
    let stateStore: Store<CountryDescriptionState, CountryDescriptionActions>
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader {_ in
                ScrollView {
                    VStack{
                        Text(emptyCountry.flag)
                            .font(.system(size: 200))
                        Text(emptyCountry.countryName)
                            .fontWeight(.regular)
                            .foregroundColor(.red)
                            .font(.bold(.largeTitle)())
                            .padding(.horizontal)

                        Spacer()
                        Text(emptyCountry.countryDescription)
                            .multilineTextAlignment(.leading)
                            .padding(.all)


                        Spacer(minLength: 500)
                    }
                    .padding(.top)
                }
                .onAppear {
                    viewStore.send(.showCountry(emptyCountry))
                }
            }
        }
        
    }
}

struct CountryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDescriptionView(stateStore: Store<CountryDescriptionState, CountryDescriptionActions>(initialState: CountryDescriptionState(),
            reducer: countryDescriptionReducer,
            environment: CountryDescriptionEnvironment()))
    }
}
