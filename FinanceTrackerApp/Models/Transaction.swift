//
//  Transaction.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let logo: String
    let title: String
    let date: String
    let amount: Double
    let category: String
}
