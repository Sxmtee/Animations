//
//  Gameview.swift
//  Animations
//
//  Created by mac on 07/06/2024.
//

import SwiftUI

struct GameView: View {
    var selectedTable: Int
    var numberOfQuestions: Int
    
    @State private var questions = [Question]()
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var showingResult = false
    
    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                Text(questions[currentQuestionIndex].text)
                    .font(.largeTitle)
                    .padding()
                
                TextField("Your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Submit") {
                    checkAnswer()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Text("Game Over! Your score: \(score)")
                    .font(.largeTitle)
                    .padding()
                
                Button("Play Again") {
                    restartGame()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        generateQuestions()
    }
    
    func generateQuestions() {
        questions.removeAll()
        for _ in 1...numberOfQuestions {
            let multiplier = Int.random(in: 2...selectedTable)
            let multiplicand = Int.random(in: 2...selectedTable)
            let questionText = "\(multiplier) x \(multiplicand)"
            let answer = multiplier * multiplicand
            let question = Question(text: questionText, answer: answer)
            questions.append(question)
        }
    }
    
    func checkAnswer() {
        if let answer = Int(userAnswer), answer == questions[currentQuestionIndex].answer {
            score += 1
        }
        userAnswer = ""
        currentQuestionIndex += 1
    }
    
    func restartGame() {
        score = 0
        currentQuestionIndex = 0
        startGame()
    }
}

