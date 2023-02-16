//
//  TurkeyModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

let turkey = CountryModel(id: UUID(),
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
                          flag: CountriesFlags.turkishFlag)
