//
//  MovieDetail.swift
//  RateMovies
//
//

import Foundation

struct MovieDetail: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
