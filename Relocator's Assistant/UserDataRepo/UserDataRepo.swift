//
//  UserDataRepo.swift
//  Relocator's Assistant
//
//  Created by Александр on 14.02.23.
//

import Foundation

//protocol UserDataRepository {
//    func saveCountryData(countryModel: CountryModel)
//    func getCountryData() -> CountryModel
//}


protocol UserPassportDate {
    func saveUserPassportDate(dateOfExpiry: Date)
    func getUserPassportDate() -> Date
}
