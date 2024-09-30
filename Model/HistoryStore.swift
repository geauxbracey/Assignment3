//
//  HistoryStore.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
 @Published var exerciseDays: [ExerciseDay] = []
    //HistoryStore is a class rather than a structure
    //when exerciseDays changes, it publishes itself (updates) to the subscriber

  init() {
      func addDoneExercise(_ exerciseName: String) {
       let today = Date()
       if today.isSameDay(as: exerciseDays[0].date) {
           //if current day is users most recent exercise day, appends current exerciseName to exercises array of current day
       print("Adding \(exerciseName)")
       exerciseDays[0].exercises.append(exerciseName)
       } else {
       exerciseDays.insert(
        //creates a new exerciseDay object and inserts it at the beginning of exerciseDays array
       ExerciseDay(date: today, exercises: [exerciseName]),
       at: 0)
       }
      }
    #if DEBUG
    createDevData()
    #endif
  }
}
