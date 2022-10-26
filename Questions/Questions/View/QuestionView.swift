//
//  QuestionView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack() {
                Text("Questions game")
                    .lightBlueTitle()
                
                Spacer()
                
                Text("1 из 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            QuestionProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("question")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("AccentColor").opacity(0.7))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.5, green: 0.5, blue: 1))
    }
        
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
