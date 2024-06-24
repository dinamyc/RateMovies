//
//  Double+Extension.swift
//  RateMovies
//
//

import Foundation

extension Double {
    func toPercentageString() -> String {
        let roundedPercentage = Int((self * 100).rounded())
        return "\(roundedPercentage)%"
    }
    
    func toPercentage() -> Int {
        return Int((self * 100).rounded())
    }
}
