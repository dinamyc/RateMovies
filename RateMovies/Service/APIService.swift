//
//  APIService.swift
//  RateMovies
//
//

import Foundation

enum APIServiceError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidResponse
}

class APIService {
    
    static let shared = APIService()

    func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.jsonParsingError(error)))
            }
            
        }.resume()
    }
}

public enum ApiKeys {
    
    public static func getMoviesAPIKey() -> String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            fatalError("Config.plist not found")
        }

        guard let config = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("Unable to parse Config.plist")
        }

        guard let apiKey = config["APIKeyMovies"] as? String else {
            fatalError("APIKeyMovies not found in Config.plist")
        }
        
        return apiKey
    }
}
