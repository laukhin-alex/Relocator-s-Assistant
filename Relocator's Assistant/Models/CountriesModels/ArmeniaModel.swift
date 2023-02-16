//
//  ArmeniaModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

let armenia = CountryModel(id: UUID(),
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
                           flag: CountriesFlags.armeniaFlag)


