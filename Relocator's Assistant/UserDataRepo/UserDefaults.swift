//
//  UserDefaults.swift
//  Relocator's Assistant
//
//  Created by Александр on 14.02.23.
//

import Foundation

let defaults = UserDefaults.standard

struct Keys {
//    static let countryRepositoryKey = "countryRepositoryKey"
    static let passportDateKey = "passportDateKey"
}

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
