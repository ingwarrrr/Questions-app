//
//  Answer.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
