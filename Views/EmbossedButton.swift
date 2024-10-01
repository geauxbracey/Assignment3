//
//  EmbossedButton.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color("drop-shadow")
        let highlight = Color("drop-highlight")
        return configuration.label
            .padding(10)
            .background(
                Capsule()
                    .stroke(Color("background"), lineWidth: 2)
                //lineWidth outlines the capsule instead of filling it with color
                    .foregroundColor(Color("background"))
                    .shadow(color: shadow, radius: 1, x: 2, y: 2)
                    .shadow(color: highlight, radius: 1, x: -2, y: -2)
                    .offset(x: -1, y: -1))
    }
    
    static var previews: some View {
        Button("History") {}
            .fontWeight(.bold)
            .buttonStyle(EmbossedButtonStyle())
            .padding(40)
            .previewLayout(.sizeThatFits)
    }
}


