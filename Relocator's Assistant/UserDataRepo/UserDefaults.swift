//
//  UserDefaults.swift
//  Relocator's Assistant
//
//  Created by Александр on 05.12.22.
//

import Foundation

let defaults = UserDefaults.standard

struct Keys {
    static let countryRepositoryKey = "countryRepositoryKey"
    static let passportDateKey = "passportDateKey"
}

struct UserDefaultsRepository: UserDataRepository, Equatable {

    func saveCountryData(countryModel: CountryModel) {

     let data = try? JSONEncoder().encode(countryModel)
        defaults.set(data, forKey: Keys.countryRepositoryKey)

    }
    func getCountryData() -> CountryModel {
        let data = (try? JSONDecoder().decode(CountryModel.self, from: defaults.value(forKey: Keys.countryRepositoryKey) as! Data)) ?? emptyCountry
        return data
    }
}


struct UserDefaultsPassportDate: UserPassportDate, Equatable {
    func saveUserPassportDate(dateOfExpiry: Date) {
        let data = try? JSONEncoder().encode(dateOfExpiry)
    }

    func getUserPassportDate() -> Date {
        let data = (try? JSONDecoder().decode(Date.self, from: defaults.value(forKey: Keys.passportDateKey) as! Data)) ?? Date()
        return data
    }
}

