//
//  RelocateStepsView.swift
//  Relocator's Assistant
//
//  Created by Александр on 06.11.22.
//

import SwiftUI

struct RelocateStepsView: View {
    var body: some View {
        Color.init(.lightGray)
                .overlay(
                    VStack{
                        Text("План")
                            .font(.system(size: 20))
                    })
                }



}

struct RelocateStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RelocateStepsView()
    }
}
