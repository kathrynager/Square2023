//
//  Label.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 2/6/23.
//

import SwiftUI

struct Label: View {
    var value: String
    var body: some View {
        Text("\(value): ")
            .bold()
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Label(value: "Label")
    }
}
