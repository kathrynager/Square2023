//
//  EmployeeService.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation
import OSLog

// EmployeeService fetches list of employees from backend
class EmployeeService: EmployeeServiceProtocol {
    
    struct Constants {
        static let https = "https://"
        static let employeeEndpoint = "/employees.json"
    }
    
    // MARK: - Properties
    
    private let url: String /// URL required to fetch from
    private let session: URLSessionProtocol
    private let logger = Logger()
    
    init(url: String, urlSession: URLSessionProtocol = URLSession.shared) {
        self.url = url
        self.session = urlSession
    }
    
    // MARK: - Functions
    
    /**
     Requests a list of employee data from the employeeEndpoint
     */
    func getEmployees() async -> Result<EmployeeResponse, EmployeeResponseError> {
        do {
            let response: EmployeeResponse = try await fetch(endpoint: Constants.employeeEndpoint)
            return .success(response)
        } catch EmployeeResponseError.invalidUrl {
            return .failure(EmployeeResponseError.invalidUrl)
        } catch EmployeeResponseError.decode {
            return .failure(EmployeeResponseError.decode)
        } catch EmployeeResponseError.fetch {
            return .failure(EmployeeResponseError.fetch)
        } catch {
            return .failure(EmployeeResponseError.unknown)
        }
    }
    
    /**
     Generic fetch which requires the endpoint to fetch.
     - Parameters:
     - endpoint: String endpoint to fetch from
     
     (Not necessary since there is only one endpoint from this service. Assuming this is a prod environment and
     there are multiple endpoints these generic functions helps reduce/reuse some code.)
     Separating the fetch and decode can catch specific errors. Copied from my personal project.
     */
    private func fetch<T: Codable>(endpoint: String) async throws -> T {
        let urlString = "https://\(url)\(endpoint)"
        
        guard let urlRequest = URL(string: urlString) else {
            logger.error("Failed to create url \(urlString)")
            throw EmployeeResponseError.invalidUrl
        }
        
        do {
            /// Fetch data
            let (data, _) = try await session.data(from: urlRequest)

            /// Decode data
            return try decode(data)
        } catch {
            logger.error("Error fetching \(error.localizedDescription)")
            throw EmployeeResponseError.fetch
        }
    }
    
    /**
     Generic decoder. Converts from snake case to camelCase
     - Parameters:
     - data: Data to decode
     */
    private func decode<T: Codable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        /// Convert to camelCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            logger.error("Error decoding \(T.self)")
            throw EmployeeResponseError.decode
        }
        return decoded
    }
}
