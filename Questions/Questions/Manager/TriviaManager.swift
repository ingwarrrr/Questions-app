//
//  TriviaManager.swift
//  Questions
//
//  Created by Igor on 28.10.2022.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published var amount = "10"
    
    func fetchTrivial() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)") else { fatalError("Ошибка Url") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Ошибка при получении данных") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Ошибка получения trivia: \(error.localizedDescription)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
