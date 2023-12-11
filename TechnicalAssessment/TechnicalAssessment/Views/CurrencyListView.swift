//
//  CurrencyListView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CurrencyListView: View {
    let coins: [CoinCellViewModel]

    static let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color.currencyListTopGradient,
            Color.currencyListBottomGradient
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(coins, id: \.symbol) { coin in
                        CoinCellView(viewModel: coin)
                    }
                }
            }
            .padding(16)
            .navigationTitle("COINS")
            .navigationBarTitleDisplayMode(.automatic)
            .background(Values.backgroundGradient)
        }
    }
}

extension CurrencyListView {
    private enum Values {
        static let backgroundGradient = LinearGradient(
            gradient: Gradient(colors: [
                Color.currencyListTopGradient,
                Color.currencyListBottomGradient
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

#Preview {
    CurrencyListView(coins: [.init(name: "Bitcoin",
                                   symbol:  "BTC",
                                   price: "$28.62K", icon: "bitcoinsign.circle.fill", priceChange: "-2.30%",
                                   isPriceIncreasing: false),
                             .init(name: "Etherum",
                                   symbol:  "ETH",
                                   price: "$28.62K", icon: "bitcoinsign.circle.fill", priceChange: "+2.30%",
                                   isPriceIncreasing: true)])
}
