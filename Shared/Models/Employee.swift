//
//  Employee.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

struct EmployeeResponse: Codable {
    var employees: [Employee]
}

struct Employee: Codable, Identifiable {
    var id: String { return uuid }
    
    var emailAddress: String
    var employeeType: EmployeeType
    var fullName: String
    var team: String
    var uuid: String
    
    var biography: String?
    var phoneNumber: String?
    var photoUrlLarge: String?
    var photoUrlSmall: String?
}

enum EmployeeType: String, Codable {
    case contractor = "CONTRACTOR"
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
}

enum EmployeeResponseError: Error {
    case decode
    case fetch
    case invalidUrl
    case unknown
}
