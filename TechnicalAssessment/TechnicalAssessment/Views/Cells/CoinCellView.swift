//
//  CoinCellView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import SwiftUI

struct CoinCellView: View {
    let viewModel: CoinCellViewModel

    var body: some View {
        NavigationLink(destination: CoinDetailView(viewModel: .init(coinId: viewModel.id, name: viewModel.name, iconURL: viewModel.iconURL))) {
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(url: viewModel.iconURL) { phase in
                    switch phase {
                        case .success(let image):
                            image.resizable().scaledToFit()
                        case .failure(_):
                            Image(systemName: "photo")
                        default:
                            ProgressView()
                    }
                }.frame(width: 56, height: 56)
                CoinInfoView(viewModel: viewModel)
            }
            .padding()
            .background(Color.cellBackground)
            .cornerRadius(16)
        }
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
    return CoinCellView(viewModel: .init(coin: coinModel))
}
