//
//  AppConstants+API.swift
//  RateMovies
//
//

import Foundation

typealias APIConstants = AppConstants.API

extension AppConstants.API {
    enum Shared {
        static let urlImage = "https://media.themoviedb.org/t/p/w440_and_h660_face/"
        static let baseUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key="
    }
}
