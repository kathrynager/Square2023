//
//  Employee+Formatters.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import Foundation

extension Employee {
    
    var employeeTypeFormatted: String {
        switch(employeeType) {
        case .contractor:
            return "Contractor"
        case .fullTime:
            return "Full Time"
        case .partTime:
            return "Part Time"
        }
    }
    
    var phoneNumberFormatted: String {
        guard let phoneNumber = phoneNumber else {
            return "N/A"
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
}
