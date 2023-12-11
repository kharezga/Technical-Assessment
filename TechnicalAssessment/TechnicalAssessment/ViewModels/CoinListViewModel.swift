//
//  CurrencyListViewModel.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

@MainActor
class CoinListViewModel: ObservableObject {
    @Published var coins: [CoinCellViewModel] = []
    @Published var isLoading = false
    private var networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func fetchCoins() async {
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
