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
            Text(CountriesFlags.armeniaFlag)
                .font(.system(size: 200))
            Text("Армения")
                .foregroundColor(.red)
                .font(.bold(.largeTitle)())
            Spacer()
            TextField("Шикарно", text: .constant("Армения - прекрасная страна"))
                .padding([.top, .leading, .bottom])
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
