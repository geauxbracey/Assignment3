//
//  TimerView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 9/30/24.
//

import SwiftUI

struct CountdownView: View {
    let date: Date
    @Binding var timeRemaining: Int
    let size: Double
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) { _ in
                //updates time remaining
                timeRemaining -= 1
            }
        }
    }
     struct TimerView: View {
         @State private var timeRemaining: Int = 3
         //timeRemaining is number of seconds timer runs for each exercise
         @Binding var timerDone: Bool
         //will change the value of timerDone when timer reaches zero
         let size: Double
   
         var body: some View {
             TimelineView(
                //creates TimelineView with animation schedule to update CountdownView every second
                .animation(
                    minimumInterval: 1.0,
                    paused: timeRemaining <= 0)) { context in
                        CountdownView(
                            date: context.date,
                            timeRemaining: $timeRemaining,
                            size: size)
                    }
                    .onChange(of: timeRemaining) { _ in
                        if timeRemaining < 1 {
                            timerDone = true
                            //enables done button in ExerciseView
                        }
                    }
         }
        }
     struct TimerView_Previews: PreviewProvider {
         static var previews: some View {
             TimerView(timerDone: .constant(false), size: 90)
         }
     }
