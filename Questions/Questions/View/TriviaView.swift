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
            VStack(spacing: 20) {
                Text("Question Game")
                    .lightBlueTitle()
                
                Text("Поздравляю, Вы прошли игру!")
                
                Text("Вы набрали \(trivialManager.score) из \(trivialManager.length)")
                
                Button {
                    Task.init {
                        await trivialManager.fetchTrivial()
                    }
                } label: {
                    MainButton(text: "Новая игра")
                }
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
