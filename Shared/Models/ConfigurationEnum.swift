//
//  ConfigurationEnum.swift
//  SquareProject2023
//
//  Created by Kathryn Ager on 1/5/23.
//

import Foundation

/// Configuration file - Converts plist/xxconfig key/values for usage
enum ConfigurationEnum {
    static var apiSquareUrl: String {
        return Bundle.main.object(forInfoDictionaryKey: "SQUARE_API_URL") as! String
    }
}
