//
//  CoinInfoView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CoinInfoView: View {
    let viewModel: CoinCellViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(viewModel.name)
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .foregroundColor(.text)
                Spacer()
                Text(viewModel.price)
                    .font(.custom("Poppins-Bold", size: 16))
                    .foregroundColor(.text)
            }

            HStack {
                Text(viewModel.symbol)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(.text)
                Spacer()
                Text(viewModel.priceChange)
                    .font(.custom("Poppins-Bold", size: 16))
                    .foregroundColor(viewModel.isPriceIncreasing ? .changeIncrease : .changeDecrease)
            }

            HStack {
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(.text)
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
                         supply: "1234.5678",
                         marketCapUsd: "20231.123",
                         volumeUsd24Hr: "1234.5678",
                         priceUsd: "1234.5678",
                         changePercent24Hr: "-0.432")
    return CoinInfoView(viewModel: .init(coin: coinModel))
}
