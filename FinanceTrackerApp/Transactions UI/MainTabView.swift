//
//  MainTabView.swift
//  FinanceTrackerApp
//
//  Created by Julius on 24/09/2025.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            NavigationStack {
                TransactionsView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationStack {
                ExchangeRatesView()
            }
            .tabItem {
                Image(systemName: "arrow.left.arrow.right")
                Text("Exchange Rates")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "dots.horizontal.fill")
                    Text("More")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding()
            
            Text("User Profile")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Nairobi, Kenya")
                .foregroundColor(.secondary)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

