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
    
    var letters: [String]
    var words: [String]
    
    var body: some View {
        VStack {
            VStack {
                Text("\(letters)")
                Text("\(words)")
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
