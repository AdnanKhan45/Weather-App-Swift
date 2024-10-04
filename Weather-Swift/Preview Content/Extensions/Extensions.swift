//
//  Extensions.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation

extension DateFormatter {
    static let weatherAPIDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
