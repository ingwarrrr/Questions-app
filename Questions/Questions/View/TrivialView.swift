//
//  TrivialView.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct TrivialView: View {
    @EnvironmentObject var trivialManager: TriviaManager

    var body: some View {
        QuestionView()
            .environmentObject(trivialManager)
    }
}

struct TrivialView_Previews: PreviewProvider {
    static var previews: some View {
        TrivialView()
            .environmentObject(TriviaManager())
    }
}
