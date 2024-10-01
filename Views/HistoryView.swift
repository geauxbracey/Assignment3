//
//  HistoryView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//


//import SwiftUI
//
//struct HistoryView: View {
//    @EnvironmentObject var history: HistoryStore
//    @Binding var showHistory: Bool
//
//  var body: some View {
//    ZStack(alignment: .topTrailing) {
//      Button(action: { showHistory.toggle() }) {
//        Image(systemName: "xmark.circle")
//      }
//      .font(.title)
//      .padding()
//
//      VStack {
//        Text("History")
//          .font(.title)
//          .padding()
//        Form {
//          ForEach(history.exerciseDays) { day in
//            Section(
//              header:
//                Text(day.date.formatted(as: "MMM d"))
//                .font(.headline)) {
//              ForEach(day.exercises, id: \.self) { exercise in
//                Text(exercise)
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//}
//
//struct HistoryView_Previews: PreviewProvider {
//  static var previews: some View {
//    HistoryView(showHistory: .constant(true))
//          .environmentObject(HistoryStore())
//  }
//}

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool
    @State private var addMode = false
    //when addMode is true, will show calendar view

  var headerView: some View {
    HStack {
        EditButton()
        //places standard edit button in headerView
      Spacer()
      Text("History")
        .font(.title)
      Spacer()
      Button {
        showHistory.toggle()
      } label: {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
        
        Button {
         addMode = true
        } label: {
         Image(systemName: "plus")
        }
        .padding(.trailing)
    }
      //creates the add button (+) which sets addMode to true if pressed
      
  }

    func dayView(day: ExerciseDay) -> some View {
     DisclosureGroup {
         BarChartDayView(day: day)
             .deleteDisabled(true)
     } label: {
     Text(day.date.formatted(as: "d MMM YYYY"))
     .font(.headline)
     }
    }
    
    func exerciseView(day: ExerciseDay) -> some View {
      ForEach(day.uniqueExercises, id: \.self) { exercise in
        Text(exercise)
              .badge(day.countExercise(exercise: exercise))
          //badge will show number of times exercise is performed to the right of the exercise name in history
      }
    }
    
   
    
    var body: some View {
      VStack {
          Group {
              //in addMode, navigation bar buttons disappear
              if addMode {
                  Text("History")
                      .font(.title)
                        } else {
                            headerView
                        }
                    }
          .padding()
          List($history.exerciseDays, editActions: [.delete]) { $day in
              if addMode {
               AddHistoryView(addMode: $addMode)
                      .background(Color.primary.colorInvert()
                      .shadow(color: .primary.opacity(0.5), radius: 7))
              }
              //when addMode is true, shows new calendar view
           dayView(day: day)
          }
      }
      .onDisappear {
       try? history.save()
      }
    }
  }



//struct HistoryView_Previews: PreviewProvider {
//  static var history = HistoryStore(preview: true)
//  static var previews: some View {
//    HistoryView(showHistory: .constant(true))
//      .environmentObject(history)
//  }
//}
// starter code for Ch 10 had this code for previews that gave error message so used previews code from previous chapter

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
          .environmentObject(HistoryStore())
  }
}
