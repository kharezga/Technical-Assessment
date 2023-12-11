//
//  CurrencyListView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CurrencyListView: View {
    @StateObject var viewModel = CurrencyListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.coins, id: \.symbol) { coin in
                        CoinCellView(viewModel: coin)
                    }
                }
            }
            .padding([.leading, .trailing], 16)
            .padding([.top], 8)
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
    CurrencyListView(viewModel: CurrencyListViewModel())
}
