//
//  ContentView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // Vertical
            Image(systemName: "iphone.crop.circle") // View
                .font(.system(size: 50))
                .imageScale(.large)
                .foregroundStyle(.blue)
            Text("Welcome to iOS 101!!")
                .font(.title2)
                .foregroundColor(.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
