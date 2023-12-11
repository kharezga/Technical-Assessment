//
//  Double+Abbrevations.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import Foundation

extension String {
    func roundedToTwoDecimalPlaces() -> String {
        guard let value = Double(self) else { return self }
        return String(format: "%.2f", value)
    }

    func formatedAsCurrencyAbbreviation() -> String {
        guard let value = Double(self) else { return self }
        return value.formattedAsCurrencyAbbreviation()
    }
}

 private extension Double {
    func formattedAsCurrencyAbbreviation() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.groupingSeparator = ""
        numberFormatter.decimalSeparator = "."

        let absValue = abs(self)
        let multiplier: Double
        let suffix: String

        switch absValue {
        case 1_000_000_000...:
            multiplier = 1_000_000_000
            suffix = "B"
        case 1_000_000...:
            multiplier = 1_000_000
            suffix = "M"
        case 1_000...:
            multiplier = 1_000
            suffix = "K"
        default:
            multiplier = 1
            suffix = ""
        }

        let formattedValue = numberFormatter.string(from: NSNumber(value: absValue / multiplier))!
        let sign = (self < 0) ? "-" : ""

        return sign + "$" + formattedValue + suffix
    }
}
