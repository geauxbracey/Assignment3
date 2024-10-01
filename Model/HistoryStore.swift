
//  HistoryStore.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.


import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []

    var uniqueExercises: [String] {
        //this property sorts alphabetically
     Array(Set(exercises)).sorted(by: <)
    }
    
    func countExercise(exercise: String) -> Int {
     exercises.filter { $0 == exercise }.count
    }
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    //HistoryStore is a class rather than a structure
    //when exerciseDays changes, it publishes itself (updates) to the subscriber
    @Published var loadingError = false
    //when loading error is true, alert pops up
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
        //two errors we check on
    }

  init() {
      func addDoneExercise(_ exerciseName: String) {
          //saves the exercise to exerciseDays when user taps done
       let today = Date()
          if let firstDate = exerciseDays.first?.date,
           today.isSameDay(as: firstDate) {
           //if current day is users most recent exercise day, appends current exerciseName to exercises array of current day
       exerciseDays[0].exercises.append(exerciseName)
       } else {
       exerciseDays.insert(
        //creates a new exerciseDay object and inserts it at the beginning of exerciseDays array
       ExerciseDay(date: today, exercises: [exerciseName]),
       at: 0)
       }
          do {
           try save()
          } catch {
           fatalError(error.localizedDescription)
          }
      }
    #if DEBUG
    //createDevData()
    #endif
      do {
          try load()
      } catch {
          loadingError = true
      }
  }
    
    func load() throws {
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
            do {
     //if history.plist doesn't exist, will throw an error
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
            let convertedPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            throw FileError.loadFailure
        }
    }
    
    func save() throws {
        let plistData = exerciseDays.map {
         [$0.id.uuidString, $0.date, $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(
             fromPropertyList: plistData,
             format: .binary,
             options: .zero)
             try data.write(to: dataURL, options: .atomic)
            } catch {
             throw FileError.saveFailure
            }
    }
    //for each element in the loop, we save a string, a date, and a [string] (2D)
    
    var dataURL: URL {
     URL.documentsDirectory
     .appendingPathComponent("history.plist")
        //plist is property list like an array that holds info
    }
    
    func addExercise(date: Date, exerciseName: String) {
        let exerciseDay = ExerciseDay(date: date, exercises:
                                        [exerciseName])
        if let index = exerciseDays.firstIndex(
            where: { $0.date.yearMonthDay <= date.yearMonthDay }) {
            if date.isSameDay(as: exerciseDays[index].date) {
                exerciseDays[index].exercises.append(exerciseName)
            } else {
                exerciseDays.insert(exerciseDay, at: index)
            }
        } else {
            exerciseDays.append(exerciseDay)
        }
        try? save()
    }
    
}

