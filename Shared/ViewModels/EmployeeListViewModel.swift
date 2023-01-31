//
//  EmployeeListViewModel.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 1/6/23.
//

import Foundation

/**
 ViewModel responsible for updating employee list for display.
 Dependency on EmployeeService to fetch the data
 */
@MainActor final class EmployeeListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var employees: [Employee] = [] /// Employee list to display
    @Published var didError: Bool = false /// Bool if fetch failed to display error state
    @Published var isLoading: Bool = false /// Bool to tell if api is loading
    
    private let employeeService: EmployeeServiceProtocol /// EmployeeService responsible for fetching the data
    
    init(employeeService: EmployeeServiceProtocol){
        self.employeeService = employeeService
    }
    
    // MARK: - Functions
    
    /// Calls employeeService to fetch employees. Returns an empty list if nil
    func getEmployees() async {
        /// Don't fetch if a fetch is already in progress
        if isLoading {
            return
        }
        didError = false
        isLoading = true
        let result = await employeeService.getEmployees()
        switch(result) {
        case .success(let data):
            /// Sort by full name
            employees = data.employees.sorted(by: { $0.fullName < $1.fullName})
        case .failure(_):
            employees = []
            didError = true
        }
        isLoading = false
        
    }
}
