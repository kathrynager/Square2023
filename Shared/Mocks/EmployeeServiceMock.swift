//
//  EmployeeServiceMock.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

class EmployeeServiceMock: EmployeeServiceProtocol {
    private var url: String
    
    init(url: String, mockGetEmployeeResponse: Result<EmployeeResponse, EmployeeResponseError> = .success(mockEmployeeResponseEmpty)) {
        self.url = url
        self.mockGetEmployeeResponse = mockGetEmployeeResponse
    }
    
    var mockGetEmployeeResponse: Result<EmployeeResponse, EmployeeResponseError> = .success(mockEmployeeResponseEmpty)
    func getEmployees() -> Result<EmployeeResponse, EmployeeResponseError> {
        return mockGetEmployeeResponse
    }
}

