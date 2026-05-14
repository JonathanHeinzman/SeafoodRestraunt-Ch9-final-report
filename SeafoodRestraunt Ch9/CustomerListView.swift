//
//  CustomerListView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/13/26.
//

import SwiftUI

struct CustomerListView: View {
    @State private var customers: [CustomerModel] = [
        CustomerModel(name: "Jonathan" , email: "jonathan@mail.com" , visits: 10),
        CustomerModel(name: "JJ" , email: "jj@mail.com" , visits: 5),
        CustomerModel(name: "Ashlie" , email: "ashlie@mail.com" , visits: 20),
    ]
    
    
    var body: some View {
        VStack {
            Text("Customers")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        List(customers) { customer in
            VStack{
                Text(customer.summary())
            }
        }
    }
}

#Preview {
    CustomerListView()
}
