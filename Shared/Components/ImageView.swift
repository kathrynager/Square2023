//
//  ImageView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    var photoUrl: String? /// URL to load
    var assetPhotoName: String /// Asset string to be placeholder or image to display if no photoURL is given
    var size: Double
    
    var assetImage: some View {
        Image(assetPhotoName)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: size, height: size, alignment: .center)
    }
    
    var body: some View {
        Group {
            if let photoUrl = photoUrl, let url = URL(string: photoUrl){
                KFImage(url)
                    .placeholder {
                        assetImage
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size, alignment: .center)
                    .clipped()
            }
            else {
                assetImage
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(photoUrl: "", assetPhotoName: "PlaceholderImage", size: 10.0)
    }
}
