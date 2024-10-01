//
//  RaisedButton.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        })
        .buttonStyle(.raised)
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
            RaisedButton(buttonText: "Get Started") {
             print("Hello World")
            }
            //trailing closure syntax
            //remove the action label and take the closure out of the method’s calling parentheses
                .buttonStyle(.raised)
                .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
     configuration.label
     .frame(maxWidth: .infinity)
        //infinity makes it take up as much space as possible
     .padding([.top, .bottom], 12)
     .background(
     Capsule()
        .foregroundColor(Color("background"))
        .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
        .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6))
        //when I added these modifiers per page 248, drop features did not appear
    }
}
//this struct gives button text a red background

extension ButtonStyle where Self == RaisedButtonStyle {
 static var raised: RaisedButtonStyle {
 .init()
 }
}
