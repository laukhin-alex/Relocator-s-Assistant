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
            Text(CountryModel.init().flag)
                .font(.system(size: 200))
            Text(CountryModel.init().countryName)
                .foregroundColor(.red)
                .font(.bold(.largeTitle)())
            Spacer()
            Text(CountryModel.init().countryDescription)
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
