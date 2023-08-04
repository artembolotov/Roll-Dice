//
//  Date-Extensions.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import Foundation

extension Date {
    func prettyFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter.string(from: self)
    }
}
