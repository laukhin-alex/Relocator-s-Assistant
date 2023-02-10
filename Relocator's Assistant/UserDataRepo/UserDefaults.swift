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

// MARK: - RAIA-3
// MARK: - test
public struct UserDefaultsPassportDate: UserPassportDate, Equatable {
    func saveUserPassportDate(dateOfExpiry: Date) {
        let data = try? JSONEncoder().encode(dateOfExpiry)
        defaults.set(data, forKey: Keys.passportDateKey)
        print(data as Any)
    }

    func getUserPassportDate() -> Date {
        let dateOne = defaults.value(forKey: Keys.passportDateKey)
        if dateOne == nil {
            let dateDefault = Date()
            saveUserPassportDate(dateOfExpiry: dateDefault)
        }
        let data = (try? JSONDecoder().decode(Date.self, from: defaults.value(forKey: Keys.passportDateKey) as! Data)) ?? Date()
        print(data)
        return data
    }
}

