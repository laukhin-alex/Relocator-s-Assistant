////
////  PassportChecking.swift
////  Relocator's Assistant
////
////  Created by Александр on 24.11.22.
////
//
//import SwiftUI
//import ComposableArchitecture
//
//
//// MARK: - рассмотреть возможность использовать Enum AppState - выбор между стейтами
//// MARK: - рассмотреть возможность использовать SwitchStore соответственно
//
//struct PassportCheckingView: View {
//    var stateStore: Store<PassportCheckingState, PassportCheckingActions>
//    var body: some View {
//        let _ = print("view rebilded")
//        WithViewStore(stateStore) { viewStore in
//            GeometryReader {_ in
//                ZStack{
//                    List {
//                        Section(header: Text("Заграничный паспорт")) {
//                            VStack {
//                                Toggle("У Вас есть Заграничный паспорт, или Вы хотите оформить его в ближайшее время?", isOn: viewStore.binding(\.$havingPassport))
//                                if  viewStore.havingPassport == true {
//                                    HStack {
//                                        Image(systemName: viewStore.passportState.dateOfExpiryMoreThanHalfYear ? "checkmark.square.fill" : "square")
//                                            .foregroundColor(viewStore.passportState.dateOfExpiryMoreThanHalfYear ? Color(UIColor.systemBlue) : Color.secondary)
//// TODO: - модернизировать переход линк: смотри поинтфри 149 урок  строки 249 - 255
//                                        NavigationLink("Настройка паспорта", destination:   PassportView(stateStore: stateStore.scope(
//                                            state: \.passportState,
//                                            action: PassportCheckingActions.passportAction
//                                        ),  date: DateOfExpiryModal()))
//                                    }
//                                }
//                            }
//
//                        }
//
//// MARK: - сделать нормальную форму - например List - ForEachStore, строки 234-246
//                        Section(header: Text("Доступные страны")) {
//                            VStack {
//                                ForEach(viewStore.chosenCountries) {
//                                    country in
//                                    HStack {
//                                        Text(country.flag)
//                                            .padding(.all)
//
//                                        Spacer()
//                                        Text(country.countryName)
//                                        Spacer()
//                                    }
//                                    .onTapGesture {
//                                        viewStore.send(.selectCountry(country))
//                                    }
//
//                                }
//                            }
//                        }
//                    }
//
//                    IfLetStore(
//                        stateStore.scope(
//                            state: \.choosingCountryState,
//                            action: PassportCheckingActions.choosingCountryActions)) { countryDescription in
//                                ChoosingCountryView(stateStore: countryDescription)
//                            }
//                }
//                .navigationTitle("Настройка")
//            }
//        }
//    }
//}
//
//struct PassportCheckingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PassportCheckingView(stateStore: Store<PassportCheckingState, PassportCheckingActions>(
//            initialState: PassportCheckingState(), reducer: passportCheckingReducer,
//            environment: PassportCheckingEnvironment()))
//    }
//}
//
//
