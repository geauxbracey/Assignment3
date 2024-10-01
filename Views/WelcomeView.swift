//
//  WelcomeView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//


import SwiftUI

struct WelcomeView: View {
  @State private var showHistory = false
  @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      VStack {
        HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
        Spacer()
        Button("History") {
          showHistory.toggle()
        }
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
        .padding(.bottom)
      }

      VStack {
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            Text("Get fit")
              .font(.largeTitle)
            Text("with high intensity interval training")
              .font(.headline)
          }
          Image("step-up")
            .resizedToFill(width: 240, height: 240)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 240.0, height: 240.0)
            .clipShape(Circle())
        }

          getStartedButton
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
  }
}

var getStartedButton: some View {
 RaisedButton(buttonText: "Get Started") {
 selectedTab = 0
 }
 .padding()
}
