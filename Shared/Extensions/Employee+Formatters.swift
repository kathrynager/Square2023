//
//  Employee+Formatters.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import Foundation

extension Employee {
    
    struct Constants {
        static let placeholderText = "--"
    }
        
    var employeeTypeFormatted: String {
        switch(employeeType) {
        case .contractor:
            return LocalizableKey.contractor.localized()
        case .fullTime:
            return LocalizableKey.fullTime.localized()
        case .partTime:
            return LocalizableKey.partTime.localized()
        }
    }
    
    var phoneNumberFormatted: String {
        guard let phoneNumber = phoneNumber else {
            return Constants.placeholderText
        }
        var phone = "("
        for (i, num) in phoneNumber.enumerated() {
            if i == 3 {
                phone.append(") ")
            }
            else if i == 6 {
                phone.append("-")
            }
            phone.append(num)
        }
        return phone
    }
    
    var biographyFormatted: String {
        guard let biography = biography else {
            return Constants.placeholderText
        }
        return biography
    }
}
