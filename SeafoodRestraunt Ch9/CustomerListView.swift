//
//  CustomerListView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/13/26.
//

import SwiftUI

struct CustomerListView: View {
    @State private var customers: [CustomerModel] = [
        CustomerModel(name: "Jonathan" , email: "jonathan@mail.com" , visits: 5),
        CustomerModel(name: "JJ" , email: "jj@mail.com" , visits: 3),
        CustomerModel(name: "Ashlie" , email: "ashlie@mail.com" , visits: 7),
    ]
    
    
    var body: some View {
        VStack {
            Text("Customers")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        List(customers) { customer in
            HStack{
                Text(customer.summary())
                
                Spacer()
                // Loyalty Badge
                if customer.visits >= 5 {
                    HStack(spacing: 4) {
                        Image(systemName: "star.circle")
                        Text("Loyalty Member")
                    }
                    .font(.caption)
                    .padding(6)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(8)
                }
            }
        }
    }
}

#Preview {
    CustomerListView()
}
