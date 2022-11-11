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
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                ZStack {
                    RelocateStepsView()

                }
                .tag(0)
                .tabItem {
                    Label("Шаги к переезду", systemImage: "figure.step.training")
                }
                CountryDescription()
                    .tag(1)
                    .tabItem {
                        Label("Описание страны", systemImage: "globe.desk")
                    }
            }
        }

        .edgesIgnoringSafeArea(.bottom)
        .tint(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
