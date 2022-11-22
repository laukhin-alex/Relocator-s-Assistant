//
//  RelocateStepsModel.swift
//  Relocator's Assistant
//
//  Created by Александр on 22.11.22.
//

import Foundation

struct RelocateStepsModel: Equatable {
    static func == (lhs: RelocateStepsModel, rhs: RelocateStepsModel) -> Bool {
        return
        lhs.havingPassport == rhs.havingPassport &&
        lhs.accessibleCountriesWithPassport == rhs.accessibleCountriesWithPassport
    }




    let havingPassport: Bool
    var accessibleCountriesWithPassport: [any CountryModelProtocol] = [ArmeniaModal.init(), GeorgiaModel.init(), KasachstanModel.init(), TurkeyModel.init()]

}
