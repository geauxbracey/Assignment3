//
//  ContentView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//

import SwiftUI

struct ContentView: View {
@SceneStorage("selectedTab") private var selectedTab = 9
  var body: some View {
    TabView(selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab)  // 1
        .tag(9)  // 2
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        ExerciseView(selectedTab: $selectedTab, index: index)
          .tag(index)  // 3
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

   // .environmentObject(HistoryStore())
      //initializes HistoryStore and passes it to TabView as an environment object
    //removed from body per page 223

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
