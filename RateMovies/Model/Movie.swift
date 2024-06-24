//
//  Movie.swift
//  RateMovies
//
//

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let average: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case average = "vote_average"
    }
}

struct MoviesResponse: Codable {
    let results: [Movie]
}
