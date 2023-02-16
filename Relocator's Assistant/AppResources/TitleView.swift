//
//  TitleView.swift
//  Relocator's Assistant
//
//  Created by Александр on 16.02.23.
//

import SwiftUI

struct TitleView: View {
    var title = "Title"

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        VStack(spacing: 15) {
            if !title.isEmpty {
                Text(title)
                    .font(.largeTitle).bold()
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView("DBL")
    }
}
