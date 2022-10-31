//
//  QuestionView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var trivialManager: TriviaManager
    
    var body: some View {
        VStack(spacing: 30) {
            HStack() {
                Text("Questions game")
                    .lightBlueTitle()
                    .padding()
                    .background(Color(.red).opacity(0.7))
                    .cornerRadius(20)
                    .shadow(radius: 8)
                
                Spacer()
                
                Text("\(trivialManager.index + 1) из \(trivialManager.length)")
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                    .padding()
                    .background(Color(.red).opacity(0.7))
                    .cornerRadius(20)
                    .shadow(radius: 8)
            }
            
            QuestionProgressBar(progress: trivialManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(trivialManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.accentColor.opacity(0.7))
                
                ForEach(trivialManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(trivialManager)
                }
            }
            
            Spacer()
            
            Button {
                trivialManager.goToNextQuestion()
            } label: {
                MainButton(text: "Следующий", background: trivialManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
            }
            .padding(40)
            .disabled(!trivialManager.answerSelected)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.5, green: 0.5, blue: 1))
        .navigationBarHidden(true)
    }
        
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
