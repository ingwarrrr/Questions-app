//
//  QuestionProgressBar.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct QuestionProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(red: 0.8, green: 0.5, blue: 1))
                .cornerRadius(10)
            
            Rectangle()
                .frame(maxWidth: progress, maxHeight: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}

struct QuestionProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        QuestionProgressBar(progress: 50)
    }
}
