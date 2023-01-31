//
//  ListItem.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import SwiftUI
import Kingfisher

/**
 ListItem component. Displays title, subTitle and a photo.
 If no photo is provided a placeholder will be displayed.
 */
struct ListItem: View {
    struct Constants {
        static let size = 50.0
    }
    
    // MARK: - Properties
    
    let title: String
    let subTitle: String
    var photoUrl: String? = nil
    
    // MARK: - Views

    var body: some View {
        HStack {
            ImageView(photoUrl: photoUrl, size: Constants.size)
                .padding([.trailing], 8)
            VStack(alignment: .leading) {
                Text(title)
                Text(subTitle)
                    .font(.caption)
            }
            Spacer()
        }
        .frame(height: 50, alignment: .leading)
        .padding([.top, .bottom], 8)
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListItem(title: "Title", subTitle: "SubTitle")
        }
        .previewLayout(.sizeThatFits)
    }
}
