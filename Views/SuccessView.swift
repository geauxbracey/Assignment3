//
//  SuccessView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//


import SwiftUI

struct SuccessView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      VStack {
        Image(systemName: "hand.raised.fill")
          .resizedToFill(width: 75, height: 75)
          .foregroundColor(.purple)
        Text("High Five!")
          .font(.largeTitle)
          .fontWeight(.bold)
        Text("""
          Good job completing all four exercises!
          Remember tomorrow's another day.
          So eat well and get some rest.
          """)
        .foregroundColor(.gray)
          .multilineTextAlignment(.center)
      }
      VStack {
        Spacer()
        Button("Continue") {
          selectedTab = 9
          dismiss()
        }
        .padding()
      }
    }
  }
}

struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    SuccessView(selectedTab: .constant(3))
  }
}