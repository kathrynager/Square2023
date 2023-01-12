//
//  EmployeeMocks.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

let mockEmployeeA: Employee = Employee(emailAddress: "mary@test.com", employeeType: .fullTime, fullName: "Mary", team: "Payments", uuid: "1")

let mockEmployeeb: Employee = Employee(emailAddress: "andrew@test.com", employeeType: .partTime, fullName: "Andrew Really Really Really Long Name ", team: "Purchasing", uuid: "2")

let mockEmployeeResponse: EmployeeResponse = EmployeeResponse(employees: [mockEmployeeA, mockEmployeeb])

let mockEmployeeResponseEmpty = EmployeeResponse(employees: [])

