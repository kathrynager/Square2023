//
//  DetailView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct DetailView: View {
    
    // MARK: - Properties
    
    struct Constants {
        static let largeImageSize = 200.0
        static let smallImageSize = 150.0
        static let borderWidth = 3.0
        static let spacing = 16.0
    }
    
    let employee: Employee
    
    // Can adjust image based on screen sizes. Can add more size checks to be more robust
    var imageSize: Double {
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight <= 680 {
            return Constants.smallImageSize
        } else {
            return Constants.largeImageSize
        }
    }
    
    // MARK: - Functions
    
    func openEmail() {
        if let url = URL(string: "mailto:\(employee.emailAddress)") {
            UIApplication.shared.open(url)
        }
    }
    
    func openPhoneNumber() {
        if let phoneNumber = employee.phoneNumber,let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - View
    
    var profileImage: some View {
        Group {
            if let largeImage = employee.photoUrlLarge {
                ImageView(photoUrl: largeImage, assetPhotoName: AssetEnum.placeholder, size: imageSize)
            } else if let smallImage = employee.photoUrlSmall {
                ImageView(photoUrl: smallImage, assetPhotoName: AssetEnum.placeholder, size: imageSize)
            } else {
                ImageView(assetPhotoName: AssetEnum.placeholder, size: Constants.largeImageSize)
            }
        }
    }
    
    var phoneLineItem: some View {
        Group {
            if employee.phoneNumber == nil {
                LineItem(label: LocalizableKey.phone.localized(), value: employee.phoneNumberFormatted)
            } else {
                HyperLinkText(label: LocalizableKey.phone.localized(), value: employee.phoneNumberFormatted, onClick: openPhoneNumber)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack() {
                profileImage
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(.blue, lineWidth: Constants.borderWidth)
                    }
                Text(employee.fullName)
                    .font(.title)
                    .bold()
                Divider()
            }
            VStack(spacing: Constants.spacing) {
                HyperLinkText(label: LocalizableKey.email.localized(), value: employee.emailAddress, onClick: openEmail)
                LineItem(label: LocalizableKey.team.localized(), value: employee.team)
                LineItem(label: LocalizableKey.type.localized(), value: employee.employeeTypeFormatted)
                phoneLineItem
                LineItem(label: LocalizableKey.biography.localized(), value: employee.biographyFormatted)
            }
            .padding()
            Spacer()
        }
    }
}

@available(iOS 16.0, *)
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(employee: mockEmployeeA)
    }
}
