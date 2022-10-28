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
        VStack(spacing: 40) {
            HStack() {
                Text("Questions game")
                    .lightBlueTitle()
                
                Spacer()
                
                Text("\(trivialManager.index + 1) из \(trivialManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            QuestionProgressBar(progress: trivialManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(trivialManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("AccentColor").opacity(0.7))
                
                ForEach(trivialManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(trivialManager)
                }
            }
            
            Button {
                trivialManager.goToNextQuestion()
            } label: {
                MainButton(text: "Следующий", background: trivialManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
            }
            .disabled(!trivialManager.answerSelected)
                    
            Spacer()
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
