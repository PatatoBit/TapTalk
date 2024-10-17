//
//  File.swift
//  TouchTalk
//
//  Created by Pat on 16/10/2567 BE.
//

import SwiftUI

struct Presser: View {
    @Binding var morseStrings: [String]
    
    @State private var state: morseState = morseState(state: .inactive)
    @State private var currentWord: String = ""
    @State var lastTime = CFAbsoluteTimeGetCurrent()
    
    let timeBetweenLetters: Double = 1
//    let timeBetweenWords: Double = 3
    
    // Append morse symbol to the current word
    func appendMorse(morse: String) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // If time between presses is greater than the time between letters, start a new word
        if (currentTime - lastTime > timeBetweenLetters) {
            if !currentWord.isEmpty {
                morseStrings.append(currentWord)
            }
            currentWord = morse // Start a new word with the new morse symbol
        } else {
            currentWord += morse // Continue appending to the current word
        }
        
        lastTime = currentTime // Update the last press time
    }
    
    var body: some View {
        VStack {
            Text("Current Word: \(currentWord)")

            Button {
                if self.state.state == .holded {
                    // Long press detected (e.g., for "_")
                    appendMorse(morse: "_")
                    self.state.state = .inactive
                } else {
                    // Short press detected (e.g., for ".")
                    appendMorse(morse: ".")
                    self.state.state = .inactive
                }
            } label: {
                Text("Tap or Hold")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .foregroundStyle(.blue)
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.1)
                .onEnded { _ in
                    state.state = .holded
                }
            )
        }
    }
}
