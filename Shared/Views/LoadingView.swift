//
//  LoadingView.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 1/10/23.
//

import SwiftUI

struct LoadingView: View {
    var label: String
    
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.3)
                .padding()
            Text(label)
                .font(.title)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(label: "Test Label")
    }
}
