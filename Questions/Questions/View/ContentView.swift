//
//  ContentView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var trivialManager = TriviaManager()
    
    enum NumberOfQuestions: String, CaseIterable, Identifiable {
        case ten = "10"
        case fifteen = "15"
        case twenty = "20"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                
                Spacer()
                
                VStack(spacing: 30) {
                    Text("Questions game")
                        .lightBlueTitle()
                        .padding()
                        .background(Color(.red).opacity(0.7))
                        .cornerRadius(20)
                        .shadow(radius: 8)
                    
                    Text("Вы готовы испытать свои знания?")
                        .foregroundColor(.accentColor)
                        .font(.title3)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        Text("Количество вопросов")
                            .foregroundColor(.accentColor)
                            .font(.title3)
                        Picker("Number of questions", selection: $trivialManager.amount) {
                            ForEach(NumberOfQuestions.allCases) { number in
                                Text(number.rawValue.capitalized).tag(number)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .foregroundColor(.accentColor)
                    }
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                
                NavigationLink {
                    TriviaView()
                        .task {
                            await trivialManager.fetchTrivial()
                        }
                        .environmentObject(trivialManager)
                } label: {
                    MainButton(text: "Вперед!")

                }
                .padding(40)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.5, green: 0.5, blue: 1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
