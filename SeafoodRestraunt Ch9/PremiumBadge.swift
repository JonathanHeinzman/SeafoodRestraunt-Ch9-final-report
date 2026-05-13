//
//  PremiumBadge.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 5/11/26.
//

import SwiftUI

struct PremiumBadge: View {
    
    var body: some View {
            HStack{
                Image(systemName: "star.circle.fill")
                    .foregroundColor(.orange)
                Text("Premium")
                    .font(.caption)
            }
            .padding(5)
            .background(Color.orange.opacity(0.15))
            .cornerRadius(6)
    }
}

#Preview {
    PremiumBadge()
}
