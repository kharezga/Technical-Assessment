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
        return value.formatAsCurrencyAbbreviation()
    }
}

extension Double {
    func formatAsCurrencyAbbreviation() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.groupingSeparator = ""
        numberFormatter.decimalSeparator = "."

        let num = abs(self)
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            return sign + "$" + numberFormatter.string(from: NSNumber(value: self / 1_000_000_000))! + "B"
        case 1_000_000...:
            return sign + "$" + numberFormatter.string(from: NSNumber(value: self / 1_000_000))! + "M"
        case 1_000...:
            return sign + "$" + numberFormatter.string(from: NSNumber(value: self / 1_000))! + "K"
        default:
            return sign + "$" + numberFormatter.string(from: NSNumber(value: self))!
        }
    }
}
