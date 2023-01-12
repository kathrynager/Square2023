//
//  EmployeeService.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

protocol EmployeeServiceProtocol {
    func getEmployees() async -> Result<EmployeeResponse, EmployeeResponseError>
}
