//
//  CoinCellViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import Foundation

struct CoinCellViewModel {
    private let rawPrice: String
    private let rawPriceChange: String
    let name: String
    let symbol: String
    let iconURL: String
    let isPriceIncreasing: Bool

    var price: String {
        rawPrice.formatedAsCurrencyAbbreviation()
    }

    var priceChange: String {
        return rawPriceChange.roundedToTwoDecimalPlaces() + "%"
    }

    init(coin: Coin) {
        self.name = coin.name
        self.symbol = coin.symbol
        self.rawPrice = coin.priceUsd
        self.iconURL = "https://coinicons-api.vercel.app/api/icon/\(coin.symbol.lowercased())"
        self.rawPriceChange = coin.changePercent24Hr
        self.isPriceIncreasing = coin.changePercent24Hr.first != "-"
    }
}
