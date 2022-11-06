//
//  CountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI

struct CountryDescription: View {
    var body: some View {
        VStack{
            Text(CountriesFlags.armeniaFlag)
                .font(.system(size: 300))
            Text("Армения")
                .font(.largeTitle)
        }
    }
}

struct CountryDescription_Previews: PreviewProvider {
    static var previews: some View {
        CountryDescription()
    }
}
