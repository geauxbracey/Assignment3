//
//  BarChartWeekView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI
import Charts

struct BarChartWeekView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var weekData: [ExerciseDay] = []
    var body: some View {
        Chart(weekData) { day in
            ForEach(Exercise.names, id: \.self) { name in
                BarMark(
                    x: .value("Date", day.date, unit: .day),
                    y: .value("Total Count", day.countExercise(exercise: name)))
                .foregroundStyle(by: .value("Exercise", name))
            }
        }
        .padding()
        .chartForegroundStyleScale([
         "Burpee": Color("chart-burpee"),
         "Squat": Color("chart-squat"),
         "Step Up": Color("chart-step-up"),
         "Sun Salute": Color("chart-sun-salute")
        ])
        .onAppear {
            let firstDate = history.exerciseDays.first?.date ?? Date()
            // if no first date, uses current date
            let dates = firstDate.previousSevenDays
            // 3
            weekData = dates.map { date in
                history.exerciseDays.first(
                    where: { $0.date.isSameDay(as: date) })
                ?? ExerciseDay(date: date)
            }
        }
    }
}

struct BarChartWeekView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartWeekView()
            .environmentObject(HistoryStore(preview: true))
        //error after page 298
             }
}
