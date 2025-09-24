//
//  ExchangeRatesView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

struct ExchangeRatesView: View {
    @Environment(\.dismiss) private var dismiss
    struct CurrencyRate: Identifiable {
        let id = UUID()
        let code: String
        let name: String
        let buy: Double
        let sell: Double
    }
    
    private let rates: [CurrencyRate] = [
        .init(code: "USD", name: "United States Dollar", buy: 144.25, sell: 145.25),
        .init(code: "GBP", name: "Great British Pound", buy: 183.80, sell: 185.22),
        .init(code: "EUR", name: "Euro", buy: 156.97, sell: 158.21),
        .init(code: "CNY", name: "China Yuan", buy: 19.81, sell: 19.98),
        .init(code: "UGX", name: "Uganda Shilling", buy: 25.61, sell: 25.86),
        .init(code: "TZS", name: "Tanzania Shilling", buy: 17.12, sell: 17.30),
        .init(code: "RWF", name: "Rwanda Franc", buy: 7.96, sell: 8.21),
        .init(code: "ZAR", name: "South Africa Rand", buy: 7.40, sell: 7.65),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: 16) {
                ForEach(rates) { rate in
                    ExchangeRateCard(rate: rate)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom)
        }
        .safeAreaPadding(.bottom)
        .navigationTitle("Exchange Rates")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

private struct ExchangeRateCard: View {
    let rate: ExchangeRatesView.CurrencyRate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(rate.code)
                        .font(.title2).bold()
                    Text(rate.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(flagEmoji(for: rate.code))
                    .font(.system(size: 48))
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Buy")
                        .foregroundColor(.green)
                        .bold()
                    Text(rate.buy, format: .number.precision(.fractionLength(2)))
                        .font(.title3).bold()
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 6) {
                    Text("Sell")
                        .foregroundColor(.red)
                        .bold()
                    Text(rate.sell, format: .number.precision(.fractionLength(2)))
                        .font(.title3).bold()
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color(.systemGray6))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 6)
        )
    }
    
    private func flagEmoji(for currencyCode: String) -> String {
        let map: [String: String] = [
            "USD": "🇺🇸", "GBP": "🇬🇧", "EUR": "🇪🇺", "CNY": "🇨🇳",
            "UGX": "🇺🇬", "TZS": "🇹🇿", "RWF": "🇷🇼", "ZAR": "🇿🇦"
        ]
        return map[currencyCode, default: "🏳️"]
    }
}

#Preview {
    ExchangeRatesView()
}
