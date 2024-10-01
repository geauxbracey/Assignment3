//
//  GradientBackground.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
    }
    
    var gradient: Gradient {
        Gradient(colors: [
            Color("gradient-top"),
            Color("gradient-bottom")
        ])
    }
}

#Preview {
    GradientBackground()
}
