//
//  MenuCardView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/11/26.
//

import SwiftUI

struct MenuCardView: View {
    let name: String
    let price: Double
    
    var body: some View {
        MenuItemRowView(name: name, price: price)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            ).padding(.horizontal)
    }
}

#Preview {
    MenuCardView(name:"Coffee", price:5.0)
    MenuCardView(name:"Latte", price:6.0)
    MenuCardView(name:"Tiramisu", price:9.0)
}
