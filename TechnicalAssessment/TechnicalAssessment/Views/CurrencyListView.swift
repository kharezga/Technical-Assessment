//
//  CurrencyListView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CurrencyListView: View {
    @ObservedObject var viewModel = CurrencyListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    coinListView
                }
            }
            .navigationTitle("COINS")
            .navigationBarTitleDisplayMode(.automatic)
            .background(Values.backgroundGradient)
            .onAppear {
                Task {
                    await viewModel.fetchTopTenCoins()
                }
            }
        }
    }

    @ViewBuilder
    private var coinListView: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.coins, id: \.symbol) { coin in
                    CoinCellView(viewModel: coin)
                }
            }
        }
        .padding([.leading, .trailing], 16)
        .padding(.top, 8)
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
