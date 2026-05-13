//
//  MenuItemRowView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/11/26.
//

import SwiftUI

struct MenuItemRowView: View {
    let name: String
    let price: Double
    
    var body: some View {
        
        HStack{
            Text(name)
                .font(.headline)
            Spacer()
            Text("$\(price,specifier:"%.2f")")
                .foregroundColor(.secondary)
            
            if price > 20 {
                /*
                HStack{
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                    Text("Premium")
                        .font(.caption)
                }
                .padding()
                .background(Color.orange.opacity(0.15))
                .cornerRadius(6)
                */
                PremiumBadge()
            }
        }
        .padding()

    }
}

#Preview {
    MenuItemRowView(name:"Pizza",price:29.99)
    MenuItemRowView(name:"Pizza",price:9.99)
    MenuItemRowView(name:"Pizza",price:20.99)
}
