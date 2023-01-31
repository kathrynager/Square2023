//
//  EmployeeListView.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//


/// Task Save request to Cache
/// Core data or file on disk
/// On app launch w/o internet access or check cache always
///  Add Detail View
///  Full Size image and all attributes about employee

import SwiftUI

@available(iOS 16.0, *)
struct EmployeeListView: View {
    @StateObject var viewModel: EmployeeListViewModel = EmployeeListViewModel(employeeService: EmployeeService(url: ConfigurationEnum.apiSquareUrl, persistanceManger: PersistanceManger()))
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    LoadingView(label: "Loading...")
                } else {
                    List(viewModel.employees) { employee in
                        NavigationLink(destination: DetailView(employee: employee)) {
                            ListItem(title: employee.fullName, subTitle: employee.team, photoUrl: employee.photoUrlSmall)
                                .progressViewStyle(.linear)
                        }
                    }
                    .refreshable {
                        await viewModel.getEmployees()
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
            .task {
                await viewModel.getEmployees()
            }
        }
    }
}

@available(iOS 16.0, *)
struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url")))
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url", mockGetEmployeeResponse: .failure(.invalidUrl))))
        EmployeeListView(viewModel: EmployeeListViewModel(employeeService:  EmployeeServiceMock(url: "test.url", mockGetEmployeeResponse: .success(mockEmployeeResponse))))
    }
}


