//
//  GeorgiaModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

let georgia = CountryModel(id: UUID(),
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
                           flag: CountriesFlags.georgianFlag)
