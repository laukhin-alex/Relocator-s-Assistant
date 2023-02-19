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
        var countries: IdentifiedArrayOf<CountryModel> = [
            CountryModel(id: UUID(),
                         countryName: "Армения",
                         timeZone: "UTC+4",
                         countryCapitalCity: "Ереван",
                         countryCurrency: "Армянский драм",
                         languages: ["Армянский", "Русский", "Английский"],
                         climate: "Субтропический, высокогорный, континентальный",
                         legalTimeOfStayWithoutVisa: 180,
                         comfortCities: ["Ереван", "Гюмри", "Ванадзор"],
                         howToGetInCountry: "Долететь на самолете, на машине через Грузию",
                         conditionsToGetResidencePermit: "Можно получить ВНЖ по работе, по учебе",
                         passportIsNeeded: false,
                         flag: CountriesFlags.armeniaFlag,
                         isChosen: false),
            CountryModel(id: UUID(),
                         countryName: "Грузия",
                         timeZone: "UTC+4",
                         countryCapitalCity: "Тбилиси",
                         countryCurrency: "Грузинский лари",
                         languages: ["Грузинский", "Английский", "Русский"],
                         climate: "Субтропический муссонный и средиземноморский",
                         legalTimeOfStayWithoutVisa: 360,
                         comfortCities: ["Тбилиси", "Батуми", "Кутаиси", "Рустави", "Зугдиди", "Гори", "Поти", "Сухуми", "Цхинвали"],
                         howToGetInCountry: "Добраться можно на машине или через Армению",
                         conditionsToGetResidencePermit: "ВНЖ можно получить по работе и ",
                         passportIsNeeded: true,
                         flag: CountriesFlags.georgianFlag,
                         isChosen: false),
            CountryModel(id: UUID(),
                         countryName: "Казахстан",
                         timeZone: "UTC+5:00 и UTC+6:00",
                         countryCapitalCity: "Астана",
                         countryCurrency: "Казахстанский тенге",
                         languages: ["Казахский","Русский"],
                         climate: "Континентальный",
                         legalTimeOfStayWithoutVisa: 30,
                         comfortCities: ["Алма-Ата", "Астана", "Шымкент", "Актобе", "Караганда", "Тараз", "Усть-Каменогорск", "Павлодар", "Атырау", "Семей"],
                         howToGetInCountry: "На машине, самолете или на поезде",
                         conditionsToGetResidencePermit: "Для нахождения больше 30 дней необходимо получить рвп",
                         passportIsNeeded: false,
                         flag: CountriesFlags.kazakhFlag,
                         isChosen: false),
            CountryModel(id: UUID(),
                         countryName: "Турция",
                         timeZone: "UTC+3",
                         countryCapitalCity: "Стамбул",
                         countryCurrency: "Турецкая лира",
                         languages: ["Турецкий", "Английский", "Немецкий", "Французский", "Арабский", "Русский"],
                         climate: "Средиземноморский, умеренно-морской, континентальный и горный",
                         legalTimeOfStayWithoutVisa: 30,
                         comfortCities: ["Стамбул", "Анкара", "Измир", "Бурса", "Адана", "Газиантеп", "Анталья", "Конья", "Мерсин"],
                         howToGetInCountry: "На самолете",
                         conditionsToGetResidencePermit: "Получить ВНЖ сложно",
                         passportIsNeeded: true,
                         flag: CountriesFlags.turkishFlag,
                         isChosen: false)
        ]

        var selection: Identified<CountryModel.ID, SingleCountryDescription.State?>?
         struct CountryModel: Equatable, Identifiable {
            let id: UUID
            var countryName: String
            var timeZone: String
            var countryCapitalCity: String
            var countryCurrency: String
            var languages: [String]
            var climate: String
            var legalTimeOfStayWithoutVisa: Int
            var comfortCities: [String]
            var howToGetInCountry: String
            var conditionsToGetResidencePermit: String
            var passportIsNeeded: Bool
            var flag: String
            var isChosen: Bool
        }

    }

    enum Action: Equatable {
        case singleCountryDescription(SingleCountryDescription.Action)
        case setNavigation(selection: UUID?)
        case setNavigationSelectionDelayCompleted
    }

    @Dependency(\.continuousClock) var clock
    private enum CancelID {}

    var body: some ReducerProtocol<State, Action> {
        Reduce <State, Action> { state, action in
            switch action {
            case .singleCountryDescription:
                return .none

            case let .setNavigation(selection: .some(id)):
              state.selection = Identified(nil, id: id)
              return .task {
                try await self.clock.sleep(for: .seconds(1))
                  return .setNavigationSelectionDelayCompleted
              }
              .cancellable(id: CancelID.self, cancelInFlight: true)

            case .setNavigation(selection: .none):
                if let selection = state.selection,
                   let countryName = selection.value?.countryName,
                   let timeZone = selection.value?.timeZone,
                   let countryCapitalCity = selection.value?.countryCapitalCity,
                   let countryCurrency = selection.value?.countryCurrency,
                   let languages = selection.value?.languages,
                   let climate = selection.value?.climate,
                   let legalTimeOfStayWithoutVisa = selection.value?.legalTimeOfStayWithoutVisa,
                   let comfortCities = selection.value?.comfortCities,
                   let howToGetInCountry = selection.value?.howToGetInCountry,
                   let conditionsToGetResidencePermit = selection.value?.conditionsToGetResidencePermit,
                   let passportIsNeeded = selection.value?.passportIsNeeded,
                   let flag = selection.value?.flag,
                   let isChosen = selection.value?.isChosen {
                    state.countries[id: selection.id]?.countryName = countryName
                    state.countries[id: selection.id]?.timeZone = timeZone
                    state.countries[id: selection.id]?.countryCapitalCity = countryCapitalCity
                    state.countries[id: selection.id]?.countryCurrency = countryCurrency
                    state.countries[id: selection.id]?.languages = languages
                    state.countries[id: selection.id]?.climate = climate
                    state.countries[id: selection.id]?.legalTimeOfStayWithoutVisa = legalTimeOfStayWithoutVisa
                    state.countries[id: selection.id]?.comfortCities = comfortCities
                    state.countries[id: selection.id]?.howToGetInCountry = howToGetInCountry
                    state.countries[id: selection.id]?.conditionsToGetResidencePermit = conditionsToGetResidencePermit
                    state.countries[id: selection.id]?.passportIsNeeded = passportIsNeeded
                    state.countries[id: selection.id]?.flag = flag
                    state.countries[id: selection.id]?.isChosen = isChosen
                }
                state.selection = nil
                return .cancel(id: CancelID.self)

            case .setNavigationSelectionDelayCompleted:
                guard let id = state.selection?.id else { return .none }
                state.selection?.value = SingleCountryDescription.State(
                        countryName: state.countries[id: id]?.countryName ?? "",
                            timeZone: state.countries[id: id]?.timeZone ?? "",
                        countryCapitalCity: state.countries[id: id]?.countryCapitalCity ?? "",
                        countryCurrency: state.countries[id: id]?.countryCurrency ?? "",
                        languages: state.countries[id: id]?.languages ?? [],
                        climate: state.countries[id: id]?.climate ?? "",
                        legalTimeOfStayWithoutVisa: state.countries[id: id]?.legalTimeOfStayWithoutVisa ?? 0,
                        comfortCities: state.countries[id: id]?.comfortCities ?? [],
                        howToGetInCountry: state.countries[id: id]?.howToGetInCountry ?? "",
                        conditionsToGetResidencePermit: state.countries[id: id]?.conditionsToGetResidencePermit ?? "",
                        passportIsNeeded: state.countries[id: id]?.passportIsNeeded ?? true,
                        flag: state.countries[id: id]?.flag ?? CountriesFlags.emptyFlag, isChosen: state.countries[id: id]?.isChosen ?? false
                )
                return .none

            }
        }
        .ifLet(\State.selection, action: /Action.singleCountryDescription) {
            EmptyReducer()
                .ifLet(\Identified<State.CountryModel.ID, SingleCountryDescription.State?>.value, action: .self) {
                    SingleCountryDescription()
                }

        }
    }

}


struct CountriesDescriptionView: View {
    let store: StoreOf<CountriesDescription>

    var body: some View {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                NavigationStack {
                    TitleView("Выбор страны")
                Form {
                    HStack {

                            Spacer()

                        Grid {
                            GridRow {
                                Image(systemName: "globe")
                                Spacer()
                                Image(systemName: "globe")
                                Spacer()
                                Image(systemName: "globe")
                            }
                            .gridCellAnchor(.trailing)
                        }
                    }
                    List {
                        ForEach(viewStore.countries) { country in
                            HStack {
                                NavigationLink(destination: IfLetStore(
                                    self.store.scope(
                                        state: \.selection?.value,
                                        action: CountriesDescription.Action.singleCountryDescription
                                    )
                                ) {
                                    SingleCountryDescriptionView(store: $0)
                                } else: {
                                    ProgressView()
                                },
                                               tag: country.id,
                                               selection: viewStore.binding(
                                                get: \.selection?.id,
                                                send: CountriesDescription.Action.setNavigation(selection:)
                                               )
                                ) {
                                    HStack {

                                        Text(country.countryName)
//                                        Text(country.flag)
                                    }
                                }
                                Grid {
                                    GridRow {
                                        if country.passportIsNeeded {
                                            Image(systemName: "xmark.circle.fill")
                                                .font(.title)
                                        } else {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.title)
                                        }
                                        Spacer()
                                        Text(country.legalTimeOfStayWithoutVisa.description)
                                        Spacer()
                                        if country.isChosen {
                                            Text(country.flag)
                                        } else {
                                            Image(systemName: "clear")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Выбор страны")
                    .navigationBarHidden(true)
                }
            }
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
