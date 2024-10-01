//
//  AddHistoryView.swift
//  Assignment3
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct AddHistoryView: View {
    @Binding var addMode: Bool
    @State private var exerciseDate = Date()
    
    var body: some View {
        VStack {
            ZStack {
                Text("Add Exercise")
                    .font(.title)
                Button("Done") {
                    addMode = false
             }
             .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ButtonsView(date: $exerciseDate)
            //passes current selected date to ButtonsView
            DatePicker(
                "Choose Date",
                selection: $exerciseDate,
                in: ...Date(),
                displayedComponents: .date)
            .datePickerStyle(.graphical)
        }
            .padding()
    }
}

struct ButtonsView: View {
    //this structure shows a button for each exercise
    @EnvironmentObject var history: HistoryStore
    @Binding var date: Date
    var body: some View {
        HStack {
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                let exerciseName =
                Exercise.exercises[index].exerciseName
                Button(exerciseName) {
                    history.addExercise(date: date, exerciseName: exerciseName)
                }
            }
        }
        .buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
        //button scales up to give you feedback when you press on it
    }
}

#Preview {
    AddHistoryView(addMode: .constant(true))
        .environmentObject(HistoryStore(preview: true))
    //error after page 293
}
