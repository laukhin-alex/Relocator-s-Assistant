//
//  RelocateStepsView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI


struct RelocateStepsView: View {
  @State var stepsCount: Int = 0

    var body: some View {

//        Color.init(.lightGray)
        NavigationView {
            List(0...stepsCount, id: \.self) { index in
                NavigationLink(destination: PassportView(),
                               label: {
                    Text("Заграничный паспорт")
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
