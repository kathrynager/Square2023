//
//  LineItem.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import SwiftUI

struct LineItem: View {

    let label: String
    let value: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Label(value: label)
            Text(value)
            Spacer()
        }
    }
}

struct LineItem_Previews: PreviewProvider {
    static var previews: some View {
        LineItem(label: "Label", value: "Value super super logn text taking up a lot of space")
    }
}
