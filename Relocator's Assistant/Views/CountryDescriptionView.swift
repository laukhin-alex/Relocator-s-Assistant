//
//  CountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI

struct CountryDescriptionView: View {

    var body: some View {
        VStack{
            Text(TurkeyModel.flag)
                .font(.system(size: 200))
            Text(TurkeyModel.countryName)
                .foregroundColor(.red)
                .font(.bold(.largeTitle)())
            Spacer()
            Text(TurkeyModel.countryDescription)
                .multilineTextAlignment(.leading)
                .padding(.vertical)

            Spacer(minLength: 500)
        }
        .padding(.top)

    }
}

struct CountryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDescriptionView()
    }
}
