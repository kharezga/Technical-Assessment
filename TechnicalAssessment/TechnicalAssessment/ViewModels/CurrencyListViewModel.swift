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
    private let networkService = NetworkService()

    init() {
        Task {
            await fetchCoins()
        }
    }

    func fetchCoins() async {
        do {
            let coinData = try await networkService.fetchCoins()
            self.coins = coinData.map(CoinCellViewModel.init)
        } catch {
            print("Error fetching coins: \(error)")
        }
    }
}
