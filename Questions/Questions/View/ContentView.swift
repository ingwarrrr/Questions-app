//
//  ContentView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var trivialManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Questions game")
                        .lightBlueTitle()
                    
                    Text("Вы готовы испытать свои знания?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    TrivialView()
                        .environmentObject(trivialManager)
                } label: {
                    MainButton(text: "Вперед!")

                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.5, green: 0.5, blue: 1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
