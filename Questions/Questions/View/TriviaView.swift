//
//  TrivialView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var trivialManager: TriviaManager

    var body: some View {
        if trivialManager.reachedEnd {
            VStack {
                Spacer()

                VStack(spacing: 30) {
                    Text("Question Game")
                        .lightBlueTitle()
                        .padding()
                        .background(Color(.red).opacity(0.7))
                        .cornerRadius(20)
                        .shadow(radius: 8)
                    
                    Text("Поздравляю, Вы прошли игру!")
                        .font(.title2)
                        .bold()
                    
                    Text("Вы набрали \(trivialManager.score) из \(trivialManager.length)")
                        .font(.title2)
                }
                
                Spacer()
                
                Button {
                    Task.init {
                        await trivialManager.fetchTrivial()
                    }
                } label: {
                    MainButton(text: "Новая игра")
                }
                .padding(30)
            }
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.5, green: 0.5, blue: 1))
        } else {
            QuestionView()
                .environmentObject(trivialManager)
        }
    }
}

struct TrivialView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
