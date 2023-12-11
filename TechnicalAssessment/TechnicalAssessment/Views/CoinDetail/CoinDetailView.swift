//
//  CoinDetailView.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CoinDetailView: View {
    @ObservedObject var viewModel: CoinDetailViewModel
    
    var body: some View {
        VStack {
            detailContent
                .background(Color.cellBackground)
                .cornerRadius(16)
                .overlay(loadingOverlay)
            Spacer()
        }
        .padding(16)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(viewModel.name)
                        .font(.custom("Poppins-Bold", size: 32))
                        .foregroundColor(.text)
                        .padding(.leading, 51)
                    Spacer()
                    AsyncImage(url: viewModel.iconURL) { imagePhase in
                        switch imagePhase {
                        case .empty: ProgressView()
                        case .success(let image): image.resizable().frame(width: 40, height: 40)
                        case .failure: Image(systemName: "photo").resizable().frame(width: 40, height: 40)
                        @unknown default: EmptyView()
                        }
                    }
                }
            } }
        .background(Values.backgroundGradient)
        .onAppear {
            Task {
                await viewModel.fetchCoin()
            }
        }
    }
    
    @ViewBuilder
    private var detailContent: some View {
        VStack(spacing: 24) {
            CoinDetailRow(title: "Price", value: viewModel.price)
                .padding([.top], 24)
            CoinDetailRow(title: "Change (24hr)", value: viewModel.priceChange, textColor: viewModel.isPriceIncreasing ? .changeIncrease : .changeDecrease)
            Divider().frame(width: 310, height: 1.5).overlay(.divider)
            CoinDetailRow(title: "Market Cap", value: viewModel.capacity)
            CoinDetailRow(title: "Volume (24hr)", value: viewModel.volume)
            CoinDetailRow(title: "Supply", value: viewModel.supply)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var loadingOverlay: some View {
        if viewModel.isLoading {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.3))
                .cornerRadius(16)
        }
    }
}

extension CoinDetailView {
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
    CoinDetailView(viewModel: .init(coinId: "bitcoin", name: "Bitcoin", iconURL:  URL(string: "https://coinicons-api.vercel.app/api/icon/bitcoin")))
}
