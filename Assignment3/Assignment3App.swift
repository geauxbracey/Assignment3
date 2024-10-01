//
//  Assignment3App.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//

import SwiftUI

@main
struct HIITFitApp: App {
@StateObject private var historyStore = HistoryStore()
    
  var body: some Scene {
    WindowGroup {
      ContentView()
            .buttonStyle(.raised)
        //whenever using a button, use the intended style I set up
            .alert(isPresented: $historyStore.loadingError) {
             Alert(
             title: Text("History"),
             message: Text(
             """
             Unfortunately we can't load your past history.
             Email support:
             support@xyz.com
             """))
            }
        //alert will pop up if history can't load
            .environmentObject(historyStore)
            .onAppear {
             print(URL.documentsDirectory)
            }
        //user data directories
    }
  }
}
