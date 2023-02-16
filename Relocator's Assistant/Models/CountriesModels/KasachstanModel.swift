//
//  KasachstanModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

let kasachstan = CountryModel(id: UUID(),
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
                              flag: CountriesFlags.kazakhFlag)
