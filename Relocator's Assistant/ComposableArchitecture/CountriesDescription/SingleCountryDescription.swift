//
//  SingleCountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 15.02.23.
//

import ComposableArchitecture
import SwiftUI

struct SingleCountryDescription: ReducerProtocol {
    struct State: Equatable {
        var countryName: String = "Пустая страна"
        var timeZone: String = "UTC-10"
        var countryCapitalCity: String = "Столица"
        var countryCurrency: String = "Доллар"
        var languages: [String] = ["Английский", "Русский"]
        var climate: String = "Умеренный"
        var legalTimeOfStayWithoutVisa: Int = 0
        var comfortCities: [String] = ["Столица", "Хоум таун"]
        var howToGetInCountry: String = "НУ там долететь на самолете..."
        var conditionsToGetResidencePermit: String = "Чтобы получить ВНЖ надо..."
        var passportIsNeeded: Bool = true
        var flag = CountriesFlags.emptyFlag
    }

    enum Action: Equatable {
        case chooseCountryButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .chooseCountryButtonTapped:
            return .none
        }
    }
}

struct SingleCountryDescriptionView: View {
    let store: StoreOf<SingleCountryDescription>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollViewReader {_ in
                VStack {
                    VStack(spacing: 10) {
                        HStack {
                            Button {

                            } label: {
                                HStack {
                                    Image(systemName: "arrow.backward")
                                    Text("Назад")
                                }
                                .font(Font.system(size: 20, design: Font.Design.default))
                            }.padding([.leading])
                            Spacer()
                        }

                        TitleView("\(viewStore.countryName) \(viewStore.flag)")

                    }
                    Form {
                        Section(header: Text("Краткая информация о стране")) {
                            VStack(alignment: .leading) {

                                Text("Столица - \(viewStore.countryCapitalCity)")
                                Divider()
                                Text("Валюта - \(viewStore.countryCurrency)")
                                Divider()
                                Text("Климат - \(viewStore.climate)")
                                Divider()
                                Text("Часовой пояс - \(viewStore.timeZone)")
                                Divider()
                                Group {
                                    if viewStore.passportIsNeeded {
                                        Text("Заграничный паспорт - обязателен")
                                    } else {
                                        Text("Заграничный паспорт - не обязателен")
                                    }
                                    Divider()
                                    if viewStore.legalTimeOfStayWithoutVisa != 0 {
                                        Text("Без визы можно находиться - \(viewStore.legalTimeOfStayWithoutVisa) дней")
                                    } else {
                                        Text("Для пребывания в стране необходима виза")
                                    }
                                }

                            }
                        }
                        .headerProminence(.increased)
                        Section(header: Text("Комфортные города для проживания")) {
                            ForEach(viewStore.comfortCities, id: \.self) { city in
                                Text(city)
                            }
                        }
                        .headerProminence(.increased)
                        Section(header: Text("Языки, используемые в стране")) {

                            ForEach(viewStore.languages, id: \.self) { language in
                                Text(language)
                            }
                        }.headerProminence(.increased)

                        Section(header: Text("Как добраться")) {

                            Text(viewStore.howToGetInCountry)
                        }
                        .headerProminence(.increased)
                        Section(header: Text("Как получить ВНЖ/ПМЖ")) {
                            Text(viewStore.conditionsToGetResidencePermit)
                        }
                        .headerProminence(.increased)
                    }
                }
                Button {

                } label: {
                    Text("Выбрать эту страну?")
                }
                .foregroundColor(.red)
                .padding(.top)
            }
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
