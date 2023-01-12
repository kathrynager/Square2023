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
    
    // MARK: - Properties
    
    let title: String
    let subTitle: String
    var photoUrl: String? = nil
    
    // MARK: - Views
    
    var placeholderImage: some View {
        Image("PlaceholderImage")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 50, height: 50)
    }
    
    /// Displays image from url and checks cache or shows placeholder image
    var photoView: some View {
        Group {
            if let photoUrl = photoUrl, let url = URL(string: photoUrl){
                KFImage(url)
                    .placeholder {
                        placeholderImage
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
            }
            else {
                placeholderImage
            }
        }
    }
    
    var body: some View {
        HStack {
            photoView
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
