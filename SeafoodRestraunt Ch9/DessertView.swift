//
//  DessertView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/9/26.
//

import SwiftUI

struct DessertView: View {
    
    // dictionary
    let dessertItems = [
        //key:value
        //name:price
        "Pizzookie with Ice Cream": 7.99,
        "Chocolate Cake": 5.50,
        "Ice Cream Sundae": 4.99,
        "Cheesecake": 7.75
    ]
    
    var body: some View {
        let sortedDesserts = dessertItems.sorted { $0.value < $1.value}
        // List
        List {
            ForEach(sortedDesserts, id:\.key){ name, price in
                
                HStack{
                    
                    MenuCardView(name: name, price: price)
                    
                    Spacer()
                    
                    if price >= 5.00 {
                        PremiumBadge()
                    }
                }
                //.listRowInsets(EdgeInsets()) // removes the default padding
                //.listRowBackground(Color.clear) // transparent backround
            }
            
            Section {
                VStack {
                    HStack {
                        Text("Total Items: \(sortedDesserts.count)")
                    }
                    HStack {
                        Text("Highest Price: $\(dessertItems.values.max() ?? 0, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Lowest Price: $\(dessertItems.values.min() ?? 0, specifier: "%.2f")")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
    }
}

#Preview {
    DessertView()
}
