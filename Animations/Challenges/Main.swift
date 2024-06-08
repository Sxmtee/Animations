//
//  Main.swift
//  Animations
//
//  Created by mac on 07/06/2024.
//

import SwiftUI

struct MainBody: View {
    @State private var selectedTable = 2
    @State private var numberOfQuestions = 5
    @State private var isGameActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper(
                    "Up to: \(selectedTable)",
                    value: $selectedTable,
                    in: 2...12
                )
                    .padding()
                
                Picker(
                    "Number of Questions",
                    selection: $numberOfQuestions
                ) {
                    ForEach([5, 10, 20], id: \.self) { num in
                        Text("\(num) questions")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                NavigationLink(
                    destination: GameView(
                        selectedTable: selectedTable,
                        numberOfQuestions: numberOfQuestions
                    ),
                    isActive: $isGameActive
                ) {
                    Text("Start Game")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Multiplication Practice")
        }
    }
}


#Preview {
    MainBody()
}
