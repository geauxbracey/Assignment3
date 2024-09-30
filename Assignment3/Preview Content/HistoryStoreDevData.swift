//
//  HistoryStoreDevData.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//

import Foundation

extension HistoryStore {
    func createDevData() {
        //don't use mutating when dealing with a class
    // Development data
    exerciseDays = [
      ExerciseDay(
        date: Date().addingTimeInterval(-86400),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[2].exerciseName
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 2),
        exercises: [
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[0].exerciseName
        ])
    ]
  }
}
