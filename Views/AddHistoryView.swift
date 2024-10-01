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

#Preview {
    AddHistoryView(addMode: .constant(true))
}
