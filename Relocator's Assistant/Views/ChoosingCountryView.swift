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
                    ZStack {
                        VStack{
                            VStack(alignment: .leading) {
                                Button {
                                } label: {
                                    Text("Назад")
                                        .frame(width: 98, height: 23)

                                        .foregroundColor(.black)
                                        .padding(.all,10)
                                        .background(.white)
                                        .cornerRadius(5)

                                }
                            }
                            VStack(alignment: .center, spacing: 6){
                                Text(viewStore.chosenCountryFlag)
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

                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 1000)
                            .frame(maxHeight: 3000)
                        }
                    }
                }
                .background(Color.green.opacity(0.8))
                .navigationBarHidden(true)
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
