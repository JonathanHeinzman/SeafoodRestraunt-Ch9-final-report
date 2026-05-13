//
//  AboutView.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 4/27/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {

        VStack (spacing: 20){
            // title
            Text("About The Daily Catch Co.")
                .font(.title)
                .bold()
                .foregroundStyle(.blue)
                .padding()
            
            // description
            Text("The Daily Catch Co is a fresh seafood restaurant dedicated to serving the finest ocean-to-table dishes. Our menu changes daily based on the freshest catch available, ensuring every visit offers something new. We pride ourselves on bold coastal flavors in a relaxed, welcoming atmosphere.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // icons (no images)
            HStack (spacing: 30) {
                Image(systemName: "fish") // View
                    .font(.system(size: 35))
                Image(systemName: "fork.knife.circle") // View
                    .font(.system(size: 40))
                Image(systemName: "water.waves") // View
                    .font(.system(size: 35))
            }
            .imageScale(.large)
            .foregroundStyle(.blue)

            .padding()
        }
    }
}

#Preview {
    AboutView()
}
