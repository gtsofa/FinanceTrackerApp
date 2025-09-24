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
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationStack {
                ExchangeRatesView()
            }
            .tabItem {
                Image(systemName: "arrow.up.arrow.down")
                Text("Exchange Rate")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
        }
        .tint(.green)
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

