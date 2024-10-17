import SwiftUI

struct Presser: View {
    @Binding var words: [[String]]
    @Binding var currentLetter: String
    
    @State private var state: morseState = morseState(state: .inactive)
    @State private var lastTime = CFAbsoluteTimeGetCurrent()
    
    let timeBetweenLetters: Double = 1.0
    let timeBetweenWords: Double = 3.0
    let autoAppendCheckInterval: Double = 0.1 // Interval to check
    
    // Timer to auto-append current letter or word
    let autoAppendMorse = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // Append morse symbol to the current letter
    func appendMorse(morse: String) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // If time between presses is greater than the letter time, start a new letter
        if currentTime - lastTime > timeBetweenLetters {
            if !currentLetter.isEmpty {
                // Append the current letter to the last word
                if let lastWordIndex = words.indices.last {
                    words[lastWordIndex].append(currentLetter)
                } else {
                    words.append([currentLetter]) // Start a new word if none exists
                }
                currentLetter = ""
            }
        }
        
        currentLetter += morse // Continue appending to the current letter
        lastTime = currentTime // Update the last press time
    }
    
    // Automatically append the letter or word based on the timing
    func autoAppendCurrentLetterOrWord() {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // Append the letter if time between letters has passed
        if currentTime - lastTime > timeBetweenLetters && !currentLetter.isEmpty {
            if let lastWordIndex = words.indices.last {
                words[lastWordIndex].append(currentLetter)
            } else {
                words.append([currentLetter])
            }
            currentLetter = "" // Clear current letter after appending
        }
        
        // If time between words has passed, end the current word and start a new one
        if currentTime - lastTime > timeBetweenWords {
            if !currentLetter.isEmpty {
                // Append the current letter to the current word before ending the word
                if let lastWordIndex = words.indices.last {
                    words[lastWordIndex].append(currentLetter)
                }
                currentLetter = "" // Clear current letter
            }
            if let lastWord = words.last, !lastWord.isEmpty {
                // Only start a new word array if the last word was not empty
                words.append([])
            }
        }
    }
    
    var body: some View {
        VStack {
            Button("Reset", systemImage: "arrow.trianglehead.counterclockwise.rotate.90") {
                words = []
            }
            
            Button {
                if self.state.state == .holded {
                    // Long press detected (for "_")
                    appendMorse(morse: "_")
                    self.state.state = .inactive
                } else {
                    // Short press detected (for ".")
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
        // Automatically check if the letter or word should be appended
        .onReceive(autoAppendMorse) { _ in
            autoAppendCurrentLetterOrWord()
        }
    }
}
