//
//  PersistanceManager.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/31/23.
//

import Foundation
import OSLog

class PersistanceManger {
    struct Constants {
        static let employeeFile = "employeeData.txt"
    }
    private let logger = Logger()

    init(){}

    var filename: URL {
        getDocumentsDirectory().appendingPathComponent(Constants.employeeFile)
    }
    
    func save(employees: EmployeeResponse) {
        do {
            var jsonString = try encode(employees)
            
            try jsonString.write(to: filename)
        } catch {
            logger.error("Failed to read from \(self.filename)")
        }
    }
    
    func read() -> EmployeeResponse? {
        do {
            let data = try Data(contentsOf: filename)
            return try decode(data)
        } catch {
            logger.error("Error reading from \(self.filename)")
        }
        return nil
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func encode(_ data: EmployeeResponse) throws -> Data {
        guard let encoded = try? JSONEncoder().encode(data) else {
            logger.error("Error encoding")
            // TODO: udpate error
            throw EmployeeResponseError.decode
        }
        
        return encoded
    }
    
    private func decode<T: Codable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            logger.error("Error decoding")
            // TODO: udpate error
            throw EmployeeResponseError.decode
        }
        return decoded
    }
}
