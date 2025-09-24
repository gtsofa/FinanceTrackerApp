//
//  TransactionsView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

struct TransactionsView: View {
    @State private var name: String = "Julius"
    
    let transactions: [Transaction] = [
        Transaction(logo: "kfc", title: "KFC Westlands", date: "June 10, 2024  02:35pm", amount: 780, category: "Eating-out"),
        Transaction(logo: "naivas", title: "Naivas Supermarket", date: "June 09, 2024  06:02pm", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
        HStack {
            Image(systemName: "person.fill")
                .frame(width: 40, height: 40)
            
            Text("Good morning \(name)")
        }
        
        CurrentBalanceView(balance: 152_500.00, moneyIn: 120_000.00, moneyOut: 12_000.00)
    
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recent Five Transactions")
                    .font(.headline)
                Spacer()
                Button("View All") {
                }
                .font(.subheadline)
                .foregroundColor(.green)
            }
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                ForEach(transactions) { txn in
                    TransactionRow(transaction: txn)
                }
            }
            .padding(.horizontal)
        }
        
        Button(action: {}, label: {
            Text("Add Transaction")
        })
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .safeAreaPadding([.top, .bottom])
    }
}

#Preview {
    TransactionsView()
}
