//
//  AppConstants+Strings.swift
//  RateMovies
//
//

import Foundation

typealias SharedConstants = AppConstants.Strings.Shared

extension AppConstants.Strings {
    enum Shared {
        static let errorTitle = "Error"
        static let okButtonTile = "OK"
        static let errorGenericDescriptionCell = "Error: Unable to dequeue MovieTableViewCell"
        static let titleLabel = "Title: "
        static let withoutDateRelease = "No release date set"
        static let releaseDateLabel = "Release date: "
        static let networkError = "Network error: "
        static let dataNotFound = "Data not found."
        static let jsonParsingError = "JSON parsing error: "
        static let invalidResponseError = "Invalid response from server."
        static let acceptaceInPercentage = "Acceptance percentage: "
        static let instructionActionRate = "Help us by rating"
        static let rateMovieInstruction = "Rate the movie"
        static let titleApp = "Top rated movies"
        static let thanksMessage = "Thanks for review the app"
    }
}
