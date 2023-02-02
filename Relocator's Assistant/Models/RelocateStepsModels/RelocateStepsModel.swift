//
//  RelocateStepsModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 22.11.22.
//

import Foundation

struct RelocateStepsModel: Equatable {
    let havingPassport: Bool = false
    var stepsCount = 0
    var accessibleCountriesWithPassport: [CountryModel] = [armenia, georgia, kasachstan, turkey]
    var accessibleCountriesWithoutPassport: [CountryModel] = [armenia, kasachstan]

}
