//
//  PersonalData.swift
//  Relocator's Assistant
//
//  Created by Александр on 12.02.23.
//

import ComposableArchitecture
import SwiftUI

private let passportReadMe = """
Несмотря на то, что гражданам РФ в некоторые страны можно въехать по паспорту гражданина РФ, мы настоятельно рекомендуем оформить заграничный паспорт.\nОбратите внимание! Заграничный паспорт можно оформить в дипломатическом представительстве РФ, однако, сроки получения паспорта превышают несколько месяцев и присутствуют огромные очереди - проще и быстрее оформить его по месту проживания.\nВот инструкция по получению:"
"""

// MARK: - PersonalData domain
struct PersonalData: ReducerProtocol {
    struct State: Equatable {
        @BindableState var havingPassport = false
        @BindableState var havingWifeOrHusband = false
        @BindableState var havingChildren = false
        @BindableState var havingPet = false
        var storage = Storage()
        
        var isSheetPresented = false
        var dateOfExpire = Date()

        struct Storage: Equatable {
            static func == (lhs: PersonalData.State.Storage, rhs: PersonalData.State.Storage) -> Bool {
                return lhs.appHavingPassport == rhs.appHavingPassport &&
                lhs.appHavingWifeOrHusband == rhs.appHavingWifeOrHusband &&
                lhs.appHavingChildren == rhs.appHavingChildren &&
                lhs.appHavingPet == rhs.appHavingPet
            }
            @AppStorage("appHavingPassport") var appHavingPassport = false
            @AppStorage("appHavingWifeOrHusband") var appHavingWifeOrHusband = false
            @AppStorage("appHavingChildren") var appHavingChildren = false
            @AppStorage("appHavingPet") var appHavingPet = false
        }
    }


    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case onAppear
        case onDisappear
        case isSheetPresented
    }

    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {

            case .binding:
                state.storage.appHavingPassport = state.havingPassport
                state.storage.appHavingWifeOrHusband = state.havingWifeOrHusband
                state.storage.appHavingChildren = state.havingChildren
                state.storage.appHavingPet = state.havingPet
                return .none

            case .isSheetPresented:
                return .none

            case .onAppear:
                state.havingPassport = state.storage.appHavingPassport
                state.havingWifeOrHusband = state.storage.appHavingWifeOrHusband
                state.havingChildren = state.storage.appHavingChildren
                state.havingPet = state.storage.appHavingPet
                return .none

            case .onDisappear:
                return .none
            }
        }
    }
}

// MARK: - PersonalData View
struct PersonalDataView: View {
    let store: StoreOf<PersonalData>


    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Form {
                    Section(header: Text("Персональные данные").font(.title).bold()) {

                        Toggle("Есть Заграничный паспорт", isOn: viewStore.binding(\.$havingPassport))
                        Toggle("Наличие супруги(а)", isOn: viewStore.binding(\.$havingWifeOrHusband))
                    }
                    Section {
                        DisclosureGroup("Как оформить заграничный паспорт") {
                            Text(passportReadMe)
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing])
                            Text("[Как заказать загранпаспорт на Госуслугах](https://www.gosuslugi.ru/help/faq/foreign_passport/23)")
                                .padding(.horizontal)
                        }
                    }
                    Section {
                        Toggle("Наличие детей", isOn: viewStore.binding(\.$havingChildren))
                        Toggle("Наличие домашних животных", isOn: viewStore.binding(\.$havingPet))
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .onDisappear {
                viewStore.send(.onDisappear)
            }
        }
    }
}


struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonalDataView(
                store: Store(
                    initialState: PersonalData.State(),
                    reducer: PersonalData()
                )
            )
        }
    }
}
