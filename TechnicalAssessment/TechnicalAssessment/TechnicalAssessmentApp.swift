//
//  TechnicalAssessmentApp.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 10/12/2023.
//

import SwiftUI

@main
struct TechnicalAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            CurrencyListView(coins: [.init(name: "Bitcoin",
                                           symbol:  "BTC",
                                           price: "$28.62K",
                                           icon: "bitcoinsign.circle.fill",
                                           priceChange: "-2.30%",
                                           isPriceIncreasing: false)])
        }
    }
}
