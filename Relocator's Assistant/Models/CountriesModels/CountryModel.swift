//
//  CountryModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 21.11.22.
//

import Foundation

struct CountryModel: Equatable, Identifiable {
    var id: UUID = UUID()
    

    var countryName: String
    var legalTimeOfStay: Int
    var passportIsNeeded: Bool
    var flag: String
    var countryDescription: String


}


let emptyCountry = CountryModel(countryName: "Упс, Вы еще не определились с выбором...",
                                legalTimeOfStay: 0,
                                passportIsNeeded: false,
                                flag: CountriesFlags.emptyFlag,
                                countryDescription: "")
