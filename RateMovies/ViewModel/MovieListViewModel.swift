//
//  MovieListViewModel.swift
//  RateMovies
//
//

import UIKit

class MovieListViewModel {
    private var apiService = APIService.shared
    private var movies = [Movie]()
    private var currentPage = AppConstants.Numbers.Shared.startPage
    private var isFetching = false
    
    var onErrorHandling: ((String) -> Void)?
    var presentMovieDetail: ((Movie) -> Void)?
    
    func fetchTopRatedMovies(completion: @escaping (Bool) -> Void) {
        guard !isFetching else { return }
        isFetching = true
        
        let apiKey = ApiKeys.getMoviesAPIKey()
        let urlString = "\(AppConstants.API.Shared.baseUrl)\(apiKey)&language=en-US&page=\(currentPage)"
        guard let url = URL(string: urlString) else { return }
        
        apiService.fetchData(url: url) { [weak self] (result: Result<MoviesResponse, APIServiceError>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isFetching = false
                switch result {
                case .success(let moviesResponse):
                    self.movies.append(contentsOf: moviesResponse.results)
                    self.currentPage += 1
                    completion(true)
                case .failure(let error):
                    let errorMessage = self.handleError(error: error)
                    self.onErrorHandling?(errorMessage)
                    completion(false)
                }
            }
        }
    }
    
    private func handleError(error: APIServiceError) -> String {
        switch error {
        case .networkError(let err):
            return "\(AppConstants.Strings.Shared.networkError) \(err.localizedDescription)"
        case .dataNotFound:
            return AppConstants.Strings.Shared.dataNotFound
        case .jsonParsingError(let err):
            return "\(AppConstants.Strings.Shared.jsonParsingError) \(err.localizedDescription)"
        case .invalidResponse:
            return AppConstants.Strings.Shared.invalidResponseError
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return movies.count
    }
    
    func movieAtIndex(_ index: Int) -> Movie {
        return movies[index]
    }
    
    func didSelectMovieAtIndex(_ index: Int) {
        let selectedMovie = movieAtIndex(index)
        presentMovieDetail?(selectedMovie)
    }
}
