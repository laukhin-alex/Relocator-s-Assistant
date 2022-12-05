//
//  UserDefaults.swift
//  Relocator's Assistant
//
//  Created by Александр on 05.12.22.
//

import Foundation

struct UserDefaultsRepo: UserDataRepo {
//    создать юзердефаултс
    func saveData(countryModel: CountryModel) {

     let data = try? JSONEncoder().encode(countryModel)


    }

    func getData() -> CountryModel {
//        try? JSONDecoder().decode(CountryModel.self, from: defaults.)
        return emptyCountry
    }


}
