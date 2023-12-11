//
//  NetworkServiceMock.swift
//  TechnicalAssessmentTests
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation
@testable import TechnicalAssessment

class MockNetworkService: NetworkServiceProtocol {
    var mockCoins: [Coin] = []
    var mockCoin: Coin?
    var fetchCoinsShouldThrowError = false
    var fetchCoinShouldThrowError = false
    
    func fetchCoins() async throws -> [Coin] {
        if fetchCoinsShouldThrowError {
            throw NetworkError.badURL
        }
        return mockCoins
    }
    
    func fetchCoin(with id: String) async throws -> Coin {
        if fetchCoinShouldThrowError {
            throw NetworkError.badURL
        }
        guard let coin = mockCoin else {
            throw NetworkError.badURL
        }
        return coin
    }
}

