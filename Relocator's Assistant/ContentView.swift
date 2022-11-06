//
//  ContentView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI

struct ContentView: View {

    @State var tabSelection: Int = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            RelocateStepsView()
                .tag(0)
                .tabItem {
                    Label("План", systemImage: "figure.step.training")
                }

            CountryDescription()
                .tag(1)
                .tabItem {
                    Label("Описание страны", systemImage: "globe.desk")
                }
        }
        .tint(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
