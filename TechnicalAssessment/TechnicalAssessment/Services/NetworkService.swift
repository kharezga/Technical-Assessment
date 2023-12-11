//
//  NetworkService.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

class NetworkService {
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(CoinApiResponse.self, from: data)
        return decodedResponse.data
    }
}
