//
//  Date+Extension.swift
//  RateMovies
//
//

import Foundation

extension DateFormatter {
   public static func spanishFormattedDate(from dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "es")
            outputFormatter.dateFormat = "dd MMM yyyy"
            let formattedDate = outputFormatter.string(from: date)
            
            return formattedDate.capitalized
        } else {
            return nil
        }
    }
}
