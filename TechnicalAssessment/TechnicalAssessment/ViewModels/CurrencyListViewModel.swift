//
//  CurrencyListViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

@MainActor
class CurrencyListViewModel: ObservableObject {
    @Published var coins: [CoinCellViewModel] = []
    @Published var isLoading = false

    private let networkService = NetworkService()

    func fetchTopTenCoins() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let coinData = try await networkService.fetchCoins()
            self.coins = coinData.map(CoinCellViewModel.init)
        } catch {
            print("Error fetching coins: \(error)")
        }
    }
}
