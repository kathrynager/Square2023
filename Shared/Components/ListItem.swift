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
        static let padding = 8.0
    }
    
    // MARK: - Properties
    
    let title: String
    let subTitle: String
    var photoUrl: String? = nil
    
    // MARK: - Views

    var body: some View {
        HStack {
            ImageView(photoUrl: photoUrl, assetPhotoName: AssetEnum.placeholder, size: Constants.size)
                .padding([.trailing], Constants.padding)
            VStack(alignment: .leading, spacing: Constants.padding) {
                Text(title)
                Text(subTitle)
                    .font(.caption)
            }
            Spacer()
        }
        .frame(alignment: .leading)
        .padding([.top, .bottom], Constants.padding)
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
