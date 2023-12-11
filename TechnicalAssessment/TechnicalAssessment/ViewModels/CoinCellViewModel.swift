//
//  CoinCellViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import Foundation

struct CoinCellViewModel {
    let id: String
    let name: String
    let symbol: String
    let price: String
    let priceChange: String
    let isPriceIncreasing: Bool
    let iconURL: URL?

    init(coin: Coin) {
        id = coin.id
        name = coin.name
        symbol = coin.symbol
        price = coin.priceUsd.formatedAsCurrencyAbbreviation()
        priceChange = coin.changePercent24Hr.roundedToTwoDecimalPlaces() + "%"
        isPriceIncreasing = coin.changePercent24Hr.first != "-"
        iconURL = URL(string: "https://coinicons-api.vercel.app/api/icon/\(coin.symbol.lowercased())") // Coin Cap API does not provie icons
    }
}
