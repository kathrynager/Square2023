//
//  HyperLinkText.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 2/6/23.
//

import SwiftUI


struct HyperLinkText: View {
    let label: String
    let value: String
    let onClick: ()->Void
    
    var body: some View {
        HStack {
            Label(value: label)
            Button(action: onClick) {
                Text(value)
            }
            Spacer()
        }
    }
}


struct HyperLinkText_Previews: PreviewProvider {
    static var previews: some View {
        HyperLinkText(label: "Label", value: "Text", onClick: {})
    }
}
