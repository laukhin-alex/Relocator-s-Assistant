//
//  UserDataRepo.swift
//  Relocator's Assistant
//
//  Created by Александр on 05.12.22.
//

import Foundation

protocol UserDataRepo {
    func saveData(countryModel: CountryModel)
    func getData() -> CountryModel
}
