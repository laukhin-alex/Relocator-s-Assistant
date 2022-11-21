//
//  RelocateStepsView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI
import ComposableArchitecture


struct RelocateStepsView: View {
  @State var stepsCount: Int = 0
    @State var isOn = false

    var body: some View {

//        Color.init(.lightGray)
        NavigationView {
            List(0...stepsCount, id: \.self) { index in
                Toggle("У Вас есть Заграничный паспорт?", isOn: $isOn)
                if isOn == true {
                    NavigationLink(destination: PassportView(stateStore: Store<PassportState, PassportActions>(
                        initialState: PassportState(), reducer: passportReducer,
                        environment: PassportEnvironment()
                    ), date: DateOfExpiryModal()),
                                   label: {
                        Text("Заграничный паспорт")
                    })
                }
                NavigationLink(destination: CountryDescriptionView(), label: {
                    Text("Test")
                })
                .navigationTitle("План перезда")
            }
    }
}

//    "У Вас есть Заграничный паспорт?"

}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RelocateStepsView()
    }
}

