//
//  RaisedButton.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Get Started")
                .raisedButtonTextStyle()
        })
    }
}

extension Text {
 func raisedButtonTextStyle() -> some View {
 self
 .font(.body)
 .fontWeight(.bold)
 }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton()
                .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.red)
    }
}
//this struct gives button text a red background

extension ButtonStyle where Self == RaisedButtonStyle {
 static var raised: RaisedButtonStyle {
 .init()
 }
}
