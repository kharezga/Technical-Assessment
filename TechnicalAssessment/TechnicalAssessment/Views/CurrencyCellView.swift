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
        AsyncImage(url: URL(string: viewModel.iconURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
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
    let coinModel = Coin(id: "1",
                         rank: "1",
                         symbol: "BTC",
                         name: "Bitcoin",
                         supply: "0",
                         priceUsd: "1234.5678",
                         changePercent24Hr: "-0.432")
    return CoinCellView(viewModel: .init(coin: coinModel))
}
