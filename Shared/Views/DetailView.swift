//
//  DetailView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import SwiftUI

struct DetailView: View {
    struct Constants {
        static let largeImageSize = 200.0
        static let smallImageSize = 50.0
    }
    
    let employee: Employee
    
    var profileImage: some View {
        Group {
            if let largeImage = employee.photoUrlLarge {
                return ImageView(photoUrl: largeImage, size: Constants.largeImageSize)
            }
            if let smallImage = employee.photoUrlSmall {
                return ImageView(photoUrl: smallImage, size: Constants.largeImageSize)
            }
            return ImageView(size: Constants.largeImageSize)
        }
    }

    var body: some View {
        // geometry not used but can be for dynamic sizing
        GeometryReader { geometry in
        VStack {
            profileImage
            VStack(alignment: .leading) {
                Text(employee.fullName)
                    .font(.title)
                    .padding(.bottom)
                LineItem(label: "Email", value: employee.emailAddress)
                LineItem(label: "Team", value: employee.team)
                LineItem(label: "Type", value: employee.employeeTypeFormatted)
                LineItem(label: "Phone", value: employee.phoneNumberFormatted)
                LineItem(label: "Biography", value: employee.biography ?? "N/A")
            }
            .padding()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(employee: mockEmployeeA)
    }
}
