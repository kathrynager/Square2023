//
//  EmployeeServiceTests.swift
//  Tests iOS
//
//  Created by Kathryn Ager on 1/5/23.
//

import XCTest

/// Tests integration wtih EmployeeService & EmployeeListViewModel
class EmployeeServiceTests: XCTestCase {
    private var employeeService: EmployeeService!
    private var session: URLSessionMock = URLSessionMock()
    
    override func setUp() {
        super.setUp()
        employeeService = EmployeeService(url: "test.com", urlSession: session)
    }
    
    // MARK: - Success Response Tests
    
    func testEmployeeFetchSuccess() async throws {
        let viewModel: EmployeeListViewModel! = await EmployeeListViewModel(employeeService: employeeService)
        let jsonString = Bundle.main.getJSONStringContents(path: "MockAPIEmployeeResponseSuccess")
        
        var isLoading = await viewModel.isLoading
        XCTAssertFalse(isLoading)

        session.result = .success(Data(jsonString.utf8))
        
        await viewModel.getEmployees()
        isLoading = await viewModel.isLoading
        let (employees, didError) = await (viewModel.employees, viewModel.didError)
        
        XCTAssertFalse(didError)
        XCTAssertFalse(isLoading)
        XCTAssertEqual(employees.count, 2)
        
        XCTAssertEqual(employees[0].fullName, "Camille Rogers")
        XCTAssertEqual(employees[0].phoneNumber, "5558531970")
        XCTAssertEqual(employees[0].emailAddress, "crogers.demo@squareup.com")
        XCTAssertEqual(employees[0].biography, "Designer on the web marketing team.")
        XCTAssertEqual(employees[0].photoUrlSmall, "https://small_photo.jpg")
        XCTAssertEqual(employees[0].photoUrlLarge, "https://large_photo.jpg")
        XCTAssertEqual(employees[0].team, "Public Web & Marketing")
        XCTAssertEqual(employees[0].employeeType, .partTime)
        
        XCTAssertEqual(employees[1].fullName, "Justine Mason")
        XCTAssertEqual(employees[1].phoneNumber, "5553280123")
        XCTAssertEqual(employees[1].emailAddress, "jmason.demo@squareup.com")
        XCTAssertEqual(employees[1].biography, "Engineer on the Point of Sale team.")
        XCTAssertEqual(employees[1].photoUrlSmall, "https://small_photo.jpg")
        XCTAssertEqual(employees[1].photoUrlLarge, "https://large_photo.jpg")
        XCTAssertEqual(employees[1].team, "Point of Sale")
        XCTAssertEqual(employees[1].employeeType, .fullTime)
    }
    
    func testEmployeeFetchEmpty() async throws {
        let viewModel: EmployeeListViewModel! = await EmployeeListViewModel(employeeService: employeeService)
        let jsonString = Bundle.main.getJSONStringContents(path: "MockAPIEmployeesResponseEmpty")
        
        var isLoading = await viewModel.isLoading
        XCTAssertFalse(isLoading)
        
        session.result = .success(Data(jsonString.utf8))

        await viewModel.getEmployees()
        isLoading = await viewModel.isLoading
        let (employees, didError) = await (viewModel.employees, viewModel.didError)

        XCTAssertFalse(didError)
        XCTAssertEqual(employees.count, 0)
        XCTAssertFalse(isLoading)
    }
    
    // MARK: - Error Response tests
    
    func testEmployeeFetchMalformed() async throws {
        let viewModel: EmployeeListViewModel! = await EmployeeListViewModel(employeeService: employeeService)
        let jsonString = Bundle.main.getJSONStringContents(path: "MockAPIEmployeeResponseMalformed")
        
        var isLoading = await viewModel.isLoading
        XCTAssertFalse(isLoading)
        
        session.result = .success(Data(jsonString.utf8))
        
        await viewModel.getEmployees()
        isLoading = await viewModel.isLoading
        let (employees, didError) = await (viewModel.employees, viewModel.didError)

        XCTAssertTrue(didError)
        XCTAssertEqual(employees.count, 0)
        XCTAssertFalse(isLoading)
    }
    

    
    func testEmployeeFetchURLError() async throws {
        let viewModel: EmployeeListViewModel! = await EmployeeListViewModel(employeeService: EmployeeService(url: "bad.url", urlSession: session))
        
        var isLoading = await viewModel.isLoading
        XCTAssertFalse(isLoading)
        
        await viewModel.getEmployees()
        isLoading = await viewModel.isLoading
        let (employees, didError) = await (viewModel.employees, viewModel.didError)

        XCTAssertTrue(didError)
        XCTAssertEqual(employees.count, 0)
        XCTAssertFalse(isLoading)
    }
}

