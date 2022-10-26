//
//  MainButton.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import SwiftUI

struct MainButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 1))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
            .shadow(radius: 12)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Следующий")
    }
}
