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
                            ZStack(alignment: .bottomTrailing) {
                                Button {
                                    viewStore.send(.back)
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.largeTitle)

                                        .foregroundColor(.black)
                                }
                                Rectangle()
                                    .fill(Color.white.opacity(0))
                            }
                            .padding(.horizontal)
                            VStack(alignment: .center){
                                Text(viewStore.chosenCountryFlag)
                                    .font(.system(size: 200))
                                Text(viewStore.chosenCountryName)
                                    .fontWeight(.regular)
                                    .foregroundColor(.red)
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Text(viewStore.choseCountryDescription)
                                    .multilineTextAlignment(.leading)
                                    .padding([.leading, .trailing])
                            }
                            .padding(.horizontal)
                            Spacer(minLength: 30)
                            VStack() {
                                Text("Вы хотите выбрать для релокации эту страну?")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.orange))
                                Button {
                                    viewStore.send(.back)
                                } label: {
                                    Text("Выбрать")
                                        .frame(width: 98, height: 23)

                                        .foregroundColor(.black)
                                        .padding(.all,10)
                                        .background(.white)
                                        .cornerRadius(5)
                                }
                            }
                        }

                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
