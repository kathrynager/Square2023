//
//  ImageView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    var photoUrl: String?
    var size: Double
    
    var placeholderImage: some View {
        Image("PlaceholderImage")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: size, height: size)
    }
    
    var body: some View {
        Group {
            if let photoUrl = photoUrl, let url = URL(string: photoUrl){
                KFImage(url)
                    .placeholder {
                        placeholderImage
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipped()
            }
            else {
                placeholderImage
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(photoUrl: "", size: 10.0)
    }
}
