//
//  TransactionListView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let logo: String
    let title: String
    let date: String
    let amount: Double
    let category: String
}

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 12) {
            Image(transaction.logo)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(8)
                .background(
                    Circle()
                        .fill(Color(.systemGray6))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(transaction.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Ksh. \(transaction.amount, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.red)
                Text(transaction.category)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        )
    }
}

struct TransactionsListView: View {
    let transactions: [Transaction] = [
        Transaction(logo: "kfc", title: "KFC Westlands", date: "June 10, 2024  02:35pm", amount: 780, category: "Eating-out"),
        Transaction(logo: "naivas", title: "Naivas Supermarket", date: "June 09, 2024  06:02pm", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
        Transaction(logo: "total", title: "Total Energies", date: "June 09, 2024  09:12am", amount: 1200, category: "Shopping"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recent Five Transactions")
                    .font(.headline)
                Spacer()
                Button("View All") {
                    // Action
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
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
            .background(Color(.systemGroupedBackground))
    }
}
