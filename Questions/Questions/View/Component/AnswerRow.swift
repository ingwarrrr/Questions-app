//
//  AnswerRow.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var trivialManager: TriviaManager
    @State private var isSelected = false
    
    var answer: Answer
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 1))
        .background(Color("AccentColor"))
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .white, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !trivialManager.answerSelected {
                isSelected = true
                trivialManager.selectAnswer(answer: answer)
            }
        }

    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: true))
            .environmentObject(TriviaManager())
    }
}
