//
//  APIServiceTests.swift
//  RateMoviesTests
//
//

import XCTest
@testable import RateMovies

protocol APIServiceProtocol {
    func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void)
}

class MockAPIService: APIServiceProtocol {
    func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        // Simulamos una respuesta exitosa con datos predefinidos
        let mockData = MockData.movieData as! T // Cambiado de MockData.data a MockData.movieData
        completion(.success(mockData))
    }
}

struct MockData {
    static let movieData: [Movie] = [
        Movie(id: 2323,
              title: "Miracle in Cell No. 7",
              releaseDate: "2019-10-10",
              posterPath: "https://example.com/image1.jpg",
              average: 8.266)
    ]
}

class APIServiceTests: XCTestCase {
    
    func testFetchData_Success() {
        // Arrange
        let mockService = MockAPIService()
        let url = URL(string: "https://api.example.com")!
        let expectation = self.expectation(description: "Expecting successful fetch")
        
        // Act
        mockService.fetchData(url: url) { (result: Result<[Movie], APIServiceError>) in // Cambiado de Movie a [Movie]
            // Assert
            switch result {
            case .success(_):
                // Successful fetch, fulfill the expectation
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected successful fetch, but got error: \(error)")
            }
        }
        
        // Wait for the expectation to be fulfilled or timed out
        waitForExpectations(timeout: 5, handler: nil)
    }
}

class ApiKeysTests: XCTestCase {
    
    func testGetMoviesAPIKey_Success() {
        // Arrange
        let apiKey = ApiKeys.getMoviesAPIKey()
        
        // Assert
        XCTAssertFalse(apiKey.isEmpty, "API key should not be empty")
    }
}
