//
//  CurrentBalanceView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

struct CurrentBalanceView: View {
    var balance: Double
    var moneyIn: Double
    var moneyOut: Double
    
    var body: some View {
        VStack {
            Text("Current Balance")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(balance, format: .number.precision(.fractionLength(2)))
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("KES")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
            }
            
            Divider().background(Color.white.opacity(0.3))
            
            HStack {
                VStack(spacing: 4.0) {
                    Text("Money In")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("\(moneyIn)")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    
                }
                
                Rectangle()
                    .fill(Color.white.opacity(0.4))
                    .frame(width: 1, height: 24)
                
                VStack(spacing: 4.0) {
                    Text("Money Out")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("\(moneyOut)")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [Color.green.opacity(0.9), Color.green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        .padding()
    }
}

#Preview {
    CurrentBalanceView(balance: 152_500.00, moneyIn: 120_000.00, moneyOut: 12_000.00)
        .preferredColorScheme(.dark)
}

