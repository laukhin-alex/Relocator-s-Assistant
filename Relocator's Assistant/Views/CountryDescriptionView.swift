//
//  CountryDescription.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI

struct CountryDescriptionView: View {

    var body: some View {
        GeometryReader {_ in
            ScrollView {
                VStack{
                    Text(emptyCountry.flag)
                        .font(.system(size: 200))
                    Text(emptyCountry.countryName)
                        .fontWeight(.regular)
                        .foregroundColor(.red)
                        .font(.bold(.largeTitle)())
                        .padding(.horizontal)

                    Spacer()
                    Text(emptyCountry.countryDescription)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
   
                    
                    Spacer(minLength: 500)
                }
                .padding(.top)
            }
        }
    }
}

struct CountryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDescriptionView()
    }
}
