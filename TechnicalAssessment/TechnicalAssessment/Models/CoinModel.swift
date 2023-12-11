//
//  CoinModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

struct CoinApiResponse: Codable {
    let data: [Coin]
    let timestamp: Int
}

struct SingleCoinApiResponse: Codable {
    let data: Coin
    let timestamp: Int
}

struct Coin: Codable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String
    let marketCapUsd: String
    let volumeUsd24Hr: String
    let priceUsd: String
    let changePercent24Hr: String
}
