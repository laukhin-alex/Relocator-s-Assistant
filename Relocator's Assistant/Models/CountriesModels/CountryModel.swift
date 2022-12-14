//
//  CountryModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

struct CountryModel: Equatable, Identifiable, Codable {
    var id: UUID 
    var countryName: String
    var legalTimeOfStay: Int
    var passportIsNeeded: Bool
    var flag: String
    var countryDescription: String

    init(countryName: String, legalTimeOfStay: Int, passportIsNeeded: Bool, flag: String, countryDescription: String, id: UUID = UUID()) {
        self.id = id
        self.countryName = countryName
        self.legalTimeOfStay = legalTimeOfStay
        self.passportIsNeeded = passportIsNeeded
        self.flag = flag
        self.countryDescription = countryDescription
    }
}


let emptyCountry = CountryModel(countryName: "Упс, Вы еще не определились с выбором...",
                                legalTimeOfStay: 0,
                                passportIsNeeded: false,
                                flag: CountriesFlags.emptyFlag,
                                countryDescription: "")
