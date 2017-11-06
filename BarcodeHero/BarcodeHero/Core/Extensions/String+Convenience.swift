//
//  String+Convenience.swift
//  BarcodeHero
//
//  Created by Brian Drelling on 11/5/17.
//  Copyright © 2017 SpotHero. All rights reserved.
//

import Foundation

extension String {
    subscript(i: Int) -> String {
//        guard i < count else {
//            throw BHError.indexOutOfBounds
//        }

        return String(self[index(startIndex, offsetBy: i)])
    }

    subscript(r: Range<Int>) -> String {
//        guard r.upperBound < count else {
//            throw BHError.indexOutOfBounds
//        }

        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }

    func indexDistance(of character: Character) throws -> Int {
        guard let index = index(of: character) else {
            throw BHError.indexOutOfBounds
        }

        return distance(from: startIndex, to: index)
    }

    func indexDistance(of character: String) throws -> Int {
        return try indexDistance(of: character[startIndex])
    }

    func substring(_ i: Int, length: Int) throws -> String {
        guard i + length < count else {
            throw BHError.indexOutOfBounds
        }

        return self[i ..< i + length]
    }
}