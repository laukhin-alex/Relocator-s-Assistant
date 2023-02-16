//
//  CountryModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

public struct CountryModel: Equatable, Identifiable {
    public var id: UUID = UUID()
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
}


let emptyCountry = CountryModel(countryName: "Пустая страна",
                                timeZone: "UTC-10",
                                countryCapitalCity: "Столица",
                                countryCurrency: "Доллар",
                                languages: ["Английский", "Русский"],
                                climate: "Умеренный",
                                legalTimeOfStayWithoutVisa: 0,
                                comfortCities: ["Столица", "Хоум таун"],
                                howToGetInCountry: "НУ там долететь на самолете...",
                                conditionsToGetResidencePermit: "Чтобы получить ВНЖ надо...",
                                passportIsNeeded: false,
                                flag: CountriesFlags.emptyFlag
                    )
