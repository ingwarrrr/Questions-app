//
//  Extensions.swift
//  Questions
//
//  Created by Igor on 26.10.2022.
//

import Foundation
import SwiftUI

extension Text {
    func lightBlueTitle() -> some View {
        self.font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("AccentColor"))
    }
}
