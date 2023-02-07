//
//  ErrorEnum.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 2/6/23.
//

import Foundation

enum EmployeeResponseError: Error {
    case decode
    case fetch
    case invalidUrl
    case unknown
}


enum PersistanceManagerError: Error {
    case decode
    case encode
    case save
}
