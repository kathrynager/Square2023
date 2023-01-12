//
//  URLSession+URLSessionProtocol.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 1/11/23.
//

import Foundation

/// Used for mocking URLSession
extension URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await data(from: url, delegate: nil)
    }
}

extension URLSession: URLSessionProtocol {}
