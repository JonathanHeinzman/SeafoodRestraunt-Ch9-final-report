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
    // sortedDesserts
    var body: some View {
        // List
        List {
            ForEach(dessertItems.sorted { $0.value < $1.value}, id:\.key){ name, price in
                MenuCardView(name: name, price: price)
                    .listRowInsets(EdgeInsets()) // removes the defult padding
                    .listRowBackground(Color.clear) // transparent backround
                
            }
        }
    }
}

#Preview {
    DessertView()
}
