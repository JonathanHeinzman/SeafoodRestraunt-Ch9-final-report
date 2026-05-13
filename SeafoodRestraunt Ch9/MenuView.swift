//
//  MenuView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/6/26.
//

import SwiftUI

struct MenuView: View {
    @State private var showMessage = false
    @State private var showAffordableOnly = false
    @State private var showDesserts = false
    
    // dictionary
    let menuItems = [
        //key:value
        //name:price
        "Swordfish Steak": 26.99,
        "Lobster Tacos": 28.75,
        "Shrimp Trio": 21.95,
        "Crab Fondue": 19.99,
        "Fish & Chips": 21.00,
        "Clam Chowder": 19.95,
        "Seared Ahi Tuna": 29.00,
        "Crab Stuffed Prawns": 39.99,
        "Surf & Turf": 29.95,
        "Spicy Tuna Rolls": 24.95,
        "Grilled Lemon Herb Halibut": 29.95,
        "Smoked Salmon Tartare": 30.95,
        "Baked Cod with Dill Sauce": 22.95
    ]
    // computed properties
    var sortedMenu: [(name: String, price: Double)]{
        menuItems
            .sorted{ $0.key < $1.key }// array of (key,value)
            .map{ (name: $0.key, price: $0.value) }// rename key,value to name,price
    }
    
    var displayedMenu: [(name: String, price: Double)]{
        if showAffordableOnly {
            return sortedMenu.filter { $0.price < 20 }// only < 20
        }else {
            return sortedMenu
        }
    }
    
    // functions
    
    func getTotalItems() -> Int {
        return menuItems.count
    }
    
    func getHighestPrice() -> Double {
        return menuItems.values.max() ?? 0.0
    }
    
    func getLowestPrice() -> Double {
        return menuItems.values.min() ?? 0.0
    }
    
    
    var body: some View {
        // 1. convert the dictionary into a sorted array
        //let sortedMenu = menuItems.sorted { $0.key < $1.key } // alphabetical order
        //let sortedMenu = menuItems.sorted { $0.value < $1.value } // listed by price
        // Header
        VStack{
            VStack{
                Image("DailyCatchLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text("Today's Menu")
                    .font(.title2)
                    .bold()
                VStack(alignment: .leading, spacing: 10){
                    Toggle("Show welcome message: ", isOn: $showMessage)
                    Toggle("Show affordable only: ", isOn: $showAffordableOnly)
                }
                .padding()
            }
            
            if showMessage{
                Text("Welcome to The Daily Catch Co!")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            
            Button("View Desserts"){
                showDesserts = true
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)
            .sheet(isPresented: $showDesserts){
                DessertView()
            }
            
            // List
            List{
                ForEach(displayedMenu, id: \.name){ name, price in
                    /*
                    HStack{
                        Text(name)
                            .font(.headline)
                        Spacer()
                        Text("$\(price,specifier:"%.2f")")
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical,5)
                    */
                    MenuItemRowView(name:name,price:price)
                }
            }
            
            // Footer
            Section {
                VStack {
                    HStack{
                        Text("Total Items: \(getTotalItems())")
                    }
                    HStack{
                        Text("Highest Price: $ \(getHighestPrice(),specifier:"%.2f")")
                    }
                    HStack{
                        Text("Lowest Price: $ \(getLowestPrice(),specifier:"%.2f")")
                        
                    }
                }
            }
        }
    }
}
    
#Preview {
    MenuView()
}

