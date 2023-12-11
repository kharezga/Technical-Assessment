//
//  NetworkService.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL, badResponse, errorDecodingData
}

class NetworkService {
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }

        guard let decodedResponse = try? JSONDecoder().decode(CoinApiResponse.self, from: data) else {
            throw NetworkError.errorDecodingData
        }
        return decodedResponse.data
    }
}
