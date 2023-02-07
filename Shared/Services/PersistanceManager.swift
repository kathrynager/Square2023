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
    
    /**
     Saves given data to file
     */
    func save(employees: EmployeeResponse) {
        do {
            try encode(employees).write(to: filename)
        } catch {
            logger.error("Error writing to \(self.filename)")
        }
    }
    /**
     Reads data from file to return
     */
    func read() -> EmployeeResponse? {
        do {
            let data = try Data(contentsOf: filename)
            let decoded: EmployeeResponse = try decode(data)
            return decoded
        } catch {
            logger.error("Error reading from \(self.filename)")
            return nil
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func encode(_ data: EmployeeResponse) throws -> Data {
        guard let encoded = try? JSONEncoder().encode(data) else {
            logger.error("Error encoding")
            throw PersistanceManagerError.encode
        }
        
        return encoded
    }
    
    private func decode<T: Codable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            logger.error("Error decoding")
            throw PersistanceManagerError.decode
        }
        return decoded
    }
}
