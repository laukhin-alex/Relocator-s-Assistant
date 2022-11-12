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

    var body: some View {

//        Color.init(.lightGray)
        NavigationView {
            List(0...stepsCount, id: \.self) { index in
                NavigationLink(destination: PassportView(stateStore: Store<PassportState, PassportActions>(
                    initialState: PassportState(), reducer: passportReducer,
                    environment: PassportEnvironment()
                )),
                               label: {
                    Text("Заграничный паспорт")
                })
                NavigationLink(destination: CountryDescription(), label: {
                    Text("Test")
                })
                .navigationTitle("План перезда")
            }
    }
}



}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RelocateStepsView()
    }
}
