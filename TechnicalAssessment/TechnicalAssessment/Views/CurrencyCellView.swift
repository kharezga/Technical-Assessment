//
//  CurrencyCellView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import SwiftUI

struct CoinCellView: View {
    let viewModel: CoinCellViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            coinIcon
            coinInfo
        }
        .padding()
        .background(Color.cellBackground)
        .cornerRadius(16)
    }

    private var coinIcon: some View {
        Image(systemName: viewModel.icon)
            .resizable()
            .scaledToFit()
            .frame(width: 56, height: 56)
            .foregroundColor(.orange)
    }

    private var coinInfo: some View {
        VStack(alignment: .leading, spacing: 16) {
            coinNameAndPrice
            coinSymbolAndChange
            navigationArrow
        }
        .padding(.leading)
    }

    private var coinNameAndPrice: some View {
        HStack {
            Text(viewModel.name).font(.headline)
            Spacer()
            Text(viewModel.price).font(.headline)
        }
    }

    private var coinSymbolAndChange: some View {
        HStack {
            Text(viewModel.symbol)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(viewModel.priceChange)
                .font(.subheadline)
                .foregroundColor(viewModel.isPriceIncreasing ? .green : .red)
        }
    }

    private var navigationArrow: some View {
        HStack {
            Spacer()
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
                .frame(width: 24, height: 24)
        }
    }
}

#Preview {
    CoinCellView(viewModel: .init(name: "Bitcoin",
                                  symbol:  "BTC",
                                  price: "$28.62K", icon: "bitcoinsign.circle.fill", priceChange: "-2.30%",
                                  isPriceIncreasing: false))
}
