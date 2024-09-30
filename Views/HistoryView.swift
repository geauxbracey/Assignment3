//
//  HistoryView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//


import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool

  var body: some View {
    ZStack(alignment: .topTrailing) {
      Button(action: { showHistory.toggle() }) {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
      .padding()

      VStack {
        Text("History")
          .font(.title)
          .padding()
        Form {
          ForEach(history.exerciseDays) { day in
            Section(
              header:
                Text(day.date.formatted(as: "MMM d"))
                .font(.headline)) {
              ForEach(day.exercises, id: \.self) { exercise in
                Text(exercise)
              }
            }
          }
        }
      }
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
  }
}
