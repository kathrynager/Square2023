//
//  URLSessionMock.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

/// Mock URLSession
class URLSessionMock: URLSessionProtocol {
    var result = Result<Data, Error>.success(Data())
    
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        try (result.get(), URLResponse())
    }
}

/// Mock Protocol
protocol URLSessionProtocol {
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse)
}
