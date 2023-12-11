//
//  CoinDetailRow.swift
//  TechnicalAssessment
//
//  Created by Harezga Kacper on 11/12/2023.
//

import SwiftUI

struct CoinDetailRow: View {
    var title: String
    var value: String
    var textColor: Color = .text
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.text)
            Spacer()
            Text(value)
                .font(.custom("Poppins-Bold", size: 16))
                .foregroundColor(textColor)
        }
        .padding([.leading, .trailing], 24)
    }
}

#Preview {
    CoinDetailRow(title: "Bitcoin", value: "1234.5678")
}
