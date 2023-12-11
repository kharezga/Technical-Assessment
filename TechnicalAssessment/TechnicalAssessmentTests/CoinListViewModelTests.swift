//
//  CoinListViewModelTests.swift
//  TechnicalAssessmentTests
//
//  Created by Harezga Kacper on 11/12/2023.
//

import XCTest
@testable import TechnicalAssessment

@MainActor
final class CoinListViewModelTests: XCTestCase {
    var viewModel: CoinListViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = CoinListViewModel(networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchCoinsSuccess() async {
        mockNetworkService.mockCoins = [Coin(id: "1", rank: "1", symbol: "a", name: "", supply: "", marketCapUsd: "", volumeUsd24Hr: "", priceUsd: "", changePercent24Hr: "")]
        await viewModel.fetchCoins()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.coins.count, 1)
    }

    func testFetchCoinsFailure() async {
        mockNetworkService.fetchCoinsShouldThrowError = true
        await viewModel.fetchCoins()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.coins.isEmpty)
    }
}
