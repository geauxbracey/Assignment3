//
//  ContainerView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI



struct ContainerView<Content: View>: View {
 var content: Content
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
             .foregroundColor(Color("background"))
            //creates rounded rectangle 
            VStack {
              Spacer()
              Rectangle()
                    .frame(height: 25)
                    .foregroundColor(Color("background"))
                }
                content
              }
            }
    
    init(@ViewBuilder content: () -> Content) {
     self.content = content()
    }
}

struct Container_Previews: PreviewProvider {
    //this structure creates VStack of two buttons; sends ContainerView the VStack as the content closure parameter; ContainerView then shows the result of running the closure content
    static var previews: some View {
        ContainerView {
            VStack {
                RaisedButton(buttonText: "Hello World") {}
                    .padding(50)
                Button("Tap me!") {}
                    .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            }
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
    }
}
