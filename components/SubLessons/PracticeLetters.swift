//
//  PracticeLetters.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import SwiftUI

struct PracticeLetters: View {
    @Binding var  currentStage: Int
    var letters: [String]

    var body: some View {
        Text("\(letters)")
        
        Button("Next") {
            currentStage += 1
        }
    }
}
