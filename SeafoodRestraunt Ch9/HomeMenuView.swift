//
//  HomeMenuView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/13/26.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Menu View") {
                    MenuView()
                }
                
                NavigationLink("Reservation Form") {
                    ReservationForm()
                }
                
                NavigationLink("Customer List") {
                    CustomerListView()
                }
                
                NavigationLink("About Us") {
                    AboutView()
                }
            }
            .navigationTitle("The Daily Catch Co. App")
        }
    }
}

#Preview {
    HomeMenuView()
}
