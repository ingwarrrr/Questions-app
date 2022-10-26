//
//  AnswerRow.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    
    var body: some View {
        HStack(spacing: 20) {
            
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
    }
}
