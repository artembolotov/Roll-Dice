//
//  Array-Extensions.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import Foundation

extension Array where Element == Int {
    func sum() -> Int {
        return self.reduce(0) { $0 + $1 }
    }
}
