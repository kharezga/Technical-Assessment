//
//  CoinInfoView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CoinInfoView: View {
    @ObservedObject var viewModel: CoinCellViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(viewModel.name).font(.headline)
                Spacer()
                Text(viewModel.price).font(.headline)
            }

            HStack {
                Text(viewModel.symbol)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(viewModel.priceChange)
                    .font(.subheadline)
                    .foregroundColor(viewModel.isPriceIncreasing ? .green : .red)
            }

            HStack {
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.leading)
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
    return CoinInfoView(viewModel: .init(coin: coinModel))
}
