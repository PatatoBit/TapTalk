//
//  SwiftUIView.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import SwiftUI

struct Lesson: View {
    @State var currentWords: [[String]] = []
    @State var currentLetter: String = ""
    
    @State var currentStage: Int = 0
    
    var letters: [String]
    var words: [String]
    
    var body: some View {
        VStack {
            VStack {
                switch currentStage {
                case 0:
                    LearnLetters(currentStage: $currentStage, letters: letters)
                case 1:
                    PracticeLetters(currentStage: $currentStage, letters: letters)
                case 2:
                    PracticeWords(currentStage: $currentStage, words: words)
                case 3:
                   Completed()
                default:
                    LearnLetters(currentStage: $currentStage, letters: letters)
                }
            }.fullFrameCentered()
            
            Spacer()
            
            VStack {
                Presser(words: $currentWords, currentLetter: $currentLetter)
            }.fullFrameCentered()
        }
        .padding(20)
    }
}

#Preview {
    Lesson(letters: ["e", "t"], words: ["tee", "ette"])
}
