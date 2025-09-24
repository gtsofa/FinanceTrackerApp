//
//  AddTransactionView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isExpense: Bool = true
    @State private var amountText: String = "1,000.00"
    @State private var date: Date = Date()
    @State private var selectedCategory: String = "Transport"
    @State private var descriptionText: String = "Fuel for wife's car"
    
    private let categories: [String] = [
        "Transport", "Groceries", "Eating-out", "Shopping", "Bills", "Salary", "Other"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Category")
                        .font(.title3).bold()
                    HStack {
                        RadioOption(isSelected: Binding(get: { !isExpense }, set: { isIncome in isExpense = !isIncome }), label: "Income")
                        Spacer()
                        RadioOption(isSelected: $isExpense, label: "Expense", accent: .green)
                    }
                }
                
                // Amount
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Text("Amount").font(.title3).bold()
                        Text("(KES)")
                            .font(.footnote)
                            .foregroundColor(.green)
                    }
                    
                    TextField("0.00", text: $amountText)
                        .keyboardType(.decimalPad)
                        .padding()
                        .frame(height: 56)
                        .background(.regularMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Date").font(.title3).bold()
                    HStack {
                        DatePicker("Date", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                        Spacer()
                        Image(systemName: "person.crop.square")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(height: 56)
                    .background(.regularMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category").font(.title3).bold()
                    HStack {
                        Picker("Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) { category in
                                Text(category).tag(category)
                            }
                        }
                        .pickerStyle(.menu)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(height: 56)
                    .background(.regularMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description").font(.title3).bold()
                    TextField("What's this for?", text: $descriptionText, axis: .vertical)
                        .lineLimit(1...3)
                        .padding()
                        .frame(minHeight: 56)
                        .background(.regularMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Add Transaction")
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .padding(.top, 8)
                .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .safeAreaPadding(.bottom)
        .navigationTitle("Add Transaction")
        .navigationBarTitleDisplayMode(.large)
    }
}

private struct RadioOption: View {
    @Binding var isSelected: Bool
    var label: String
    var accent: Color = .green
    
    var body: some View {
        Button(action: { isSelected.toggle() }) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                        .frame(width: 28, height: 28)
                    if isSelected {
                        Circle()
                            .fill(accent)
                            .frame(width: 14, height: 14)
                    }
                }
                Text(label)
                    .font(.title3)
            }
        }
        .tint(accent)
    }
}

#Preview {
    AddTransactionView()
}
