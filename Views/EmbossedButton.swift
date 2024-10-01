//
//  EmbossedButton.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI



struct EmbossedButtonStyle: ButtonStyle {
    
    var buttonShape = EmbossedButtonShape.capsule
    
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color("drop-shadow")
        let highlight = Color("drop-highlight")
        return configuration.label
            .padding(10)
            .background(
                GeometryReader { geometry in
                    shape(size: geometry.size)
                        .foregroundColor(Color("background"))
                        .shadow(color: shadow, radius: 1, x: 2, y: 2)
                        .shadow(color: highlight, radius: 1, x: -2, y: -2)
                        .offset(x: -1, y: -1)
                })
    }
    
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        //passing size of contents of button to determine larger unit W or H
        switch buttonShape {
        case .round:
            Circle()
                .stroke(Color("background"), lineWidth: 2)
                .frame(
                 width: max(size.width, size.height),
                 height: max(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 +
                 min(size.width, size.height) / 2)
            //sets the frame to the larger of the width or height
        case .capsule:
            Capsule()
                .stroke(Color("background"), lineWidth: 2)
        }
    }
    
    static var previews: some View {
        Button("History") {}
            .fontWeight(.bold)
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            .padding(40)
            .previewLayout(.sizeThatFits)
    }
    
    enum EmbossedButtonShape {
     case round, capsule
    }
    
}


