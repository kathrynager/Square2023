//
//  EmployeeListView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject var viewModel: EmployeeListViewModel = EmployeeListViewModel(employeeService: EmployeeService(url: ConfigurationEnum.apiSquareUrl))
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                LoadingView(label: "Loading...")
            } else {
                List(viewModel.employees) { employee in
                    ListItem(title: employee.fullName, subTitle: employee.team, photoUrl: employee.photoUrlSmall)
                        .progressViewStyle(.linear)
                }
                .refreshable {
                    viewModel.getEmployees()
                }
                .overlay {
                    if viewModel.didError {
                        VStack {
                            Text("Oops!")
                            Text("Pull down to try again!")
                        }
                        .font(.title)
                    } else if viewModel.employees.count == 0 {
                        Text("No Employees to Display")
                            .font(.title)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getEmployees()
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url")))
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url", mockGetEmployeeResponse: .failure(.invalidUrl))))
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url", mockGetEmployeeResponse: .success(mockEmployeeResponse))))
    }
}
