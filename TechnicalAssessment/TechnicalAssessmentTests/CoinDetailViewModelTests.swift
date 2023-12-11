//
//  CoinDetailViewModelTests.swift
//  TechnicalAssessmentTests
//
//  Created by Harezga Kacper on 11/12/2023.
//

import XCTest
@testable import TechnicalAssessment

@MainActor
final class CoinDetailViewModelTests: XCTestCase {
    var viewModel: CoinDetailViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = CoinDetailViewModel(coinId: "testCoinId", name: "TestCoin", iconURL: nil, networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchCoinSuccess() async {
        mockNetworkService.mockCoins = [Coin(id: "testCoinId", rank: "1", symbol: "a", name: "TestCoin", supply: "", marketCapUsd: "", volumeUsd24Hr: "", priceUsd: "", changePercent24Hr: "")]
        await viewModel.fetchCoin()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.name, "TestCoin")
    }

    func testFetchCoinFailure() async {
        mockNetworkService.fetchCoinShouldThrowError = true
        await viewModel.fetchCoin()

        XCTAssertFalse(viewModel.isLoading)
    }

}
