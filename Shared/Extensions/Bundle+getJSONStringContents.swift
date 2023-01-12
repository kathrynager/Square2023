//
//  Bundle+getJSONStringContents.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 1/11/23.
//

import Foundation

extension Bundle {
    /// Reads file contens of JSON and returns a string of the contents
    func getJSONStringContents(path: String) -> String {
        guard let contents = Bundle.main.path(forResource: path, ofType: "json") else {
            fatalError("\(path).json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: contents, encoding: .utf8) else {
            fatalError("Unable to convert \(path).json to String")
        }
        return jsonString
    }
}
