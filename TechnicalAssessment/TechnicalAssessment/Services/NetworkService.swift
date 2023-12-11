//
//  NetworkService.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL, badResponse(statusCode: Int), errorDecodingData(error: Error)
}

class NetworkService {
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.badResponse(statusCode: -1)
            }

            guard httpResponse.statusCode == 200 else {
                throw NetworkError.badResponse(statusCode: httpResponse.statusCode)
            }

            do {
                let decodedResponse = try JSONDecoder().decode(CoinApiResponse.self, from: data)
                return decodedResponse.data
            } catch {
                throw NetworkError.errorDecodingData(error: error)
            }
        } catch {
            throw error
        }
    }
}
