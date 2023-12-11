//
//  CoinDetailViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

@MainActor
class CoinDetailViewModel: ObservableObject {
    @Published var isLoading = false
    
    private let coinId: String
    var capacity: String = ""
    var name: String
    var volume: String = ""
    var supply: String = ""
    var price: String = ""
    var priceChange: String = ""
    var isPriceIncreasing: Bool = false
    var iconURL: URL?
    
    func fetchCoin() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let coinData = try await NetworkService.shared.fetchCoin(with: coinId)
            self.name = coinData.name
            self.capacity = coinData.marketCapUsd.formatedAsCurrencyAbbreviation()
            self.volume = coinData.volumeUsd24Hr.formatedAsCurrencyAbbreviation()
            self.supply = coinData.supply.formatedAsCurrencyAbbreviation()
            self.price = coinData.priceUsd.formatedAsCurrencyAbbreviation()
            self.priceChange = coinData.changePercent24Hr.roundedToTwoDecimalPlaces() + "%"
            self.isPriceIncreasing = coinData.changePercent24Hr.first != "-"
            self.iconURL = URL(string: "https://coinicons-api.vercel.app/api/icon/\(coinData.symbol.lowercased())") // Coin Cap API does not provie icons
        } catch {
            print("Error fetching coins: \(error)")
        }
    }
    
    init (coinId: String, name: String, iconURL: URL?) {
        self.coinId = coinId
        self.name = name
        self.iconURL = iconURL
    }
}
