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
        GeometryReader { geometry in
            //GeometryReader determines size
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                Spacer()
                ContainerView{
                    ViewThatFits{
                        VStack {
                            WelcomeView.images
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }
                        VStack {
                            //this second VStack is for if the first Vstack format doesn't fit device (space is tight)
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
            .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
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
    
    var historyButton: some View {
    //this property formats a new History button and uses default capsule shape for button style
        Button(
            action: {
                showHistory = true
            }, label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
            .padding(.bottom, 10)
            .buttonStyle(EmbossedButtonStyle())
        }
}


