//
//  PalindromChecker.swift
//  03 Alert Controller
//
//  Created by Евгений Бияк on 30.05.2022.
//

import Foundation

struct PalindromChecker {
    func check(myString string: String) -> Bool {
        let string = string.lowercased().trimmingCharacters(in: .whitespaces)
        let reversedString = String(string.reversed())
        return string == reversedString
    }
}
