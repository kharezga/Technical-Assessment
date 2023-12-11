//
//  CoinCellViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import Foundation

class CoinCellViewModel: ObservableObject {
    @Published private var coin: Coin

    var name: String { coin.name }
    var symbol: String { coin.symbol }
    var price: String { coin.priceUsd.formatedAsCurrencyAbbreviation() }
    var priceChange: String { coin.changePercent24Hr.roundedToTwoDecimalPlaces() + "%" }
    var isPriceIncreasing: Bool { coin.changePercent24Hr.first != "-" }

    lazy var iconURL: URL? = {
        URL(string: "https://coinicons-api.vercel.app/api/icon/\(coin.symbol.lowercased())") // Coin Cap API does not provie icons
    }()

    init(coin: Coin) {
        self.coin = coin
    }
}
