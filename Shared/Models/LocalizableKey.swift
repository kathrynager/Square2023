//
//  LocalizableKey.swift
//  SquareProject2023 (iOS)
//
//  Created by Kathryn Ager on 2/6/23.
//

import Foundation
import SwiftUI
/**
 The keys correspond to the localizable files. Utilize this struct to refer to strings in the app
 */
enum LocalizableKey: String {
    case biography = "Biography"
    case contractor = "Contractor"
    case email = "Email"
    case fullTime = "Full Time"
    case loading = "Loading"
    case noEmployeesToDisplay = "No Employees to Display"
    case oops = "Oops"
    case partTime = "Part Time"
    case phone = "Phone"
    case pullToTryAgain = "Pull to try again"
    case team = "Team"
    case type = "Type"
    
    func localized() ->  String {
        return NSLocalizedString(self.rawValue, comment: "Square")
    }

}
