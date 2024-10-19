import SwiftUI

struct morseState {
    enum State {
        case pressed
        case holded
        case inactive
    }
    var state: State = .inactive
}

struct ContentView: View {
    @State var words: [[String]] = [[]] // Stores the words and letters
    @State var currentLetter = ""
    @State private var showBlinkingCursor: Bool = true // Controls the blinking effect
    
    var body: some View {
        VStack {
            VStack {
                ScrollView(.horizontal) {
                    ScrollViewReader { value in
                        HStack(spacing: 60) {
                            ForEach(words.indices, id: \.self) { wordIndex in
                                HStack(spacing: 10) {
                                    ForEach(words[wordIndex], id: \.self) { letter in
                                        MorseLetter(morseLetter: letter)
                                    }
                                    
                                    // Add blinking cursor next to the last letter of the current word
                                    if wordIndex == words.count - 1 {
                                        MorsePreview(currentMorse: $currentLetter)
                                    }
                                } // Letters HStack
                                .id(wordIndex) // Add id to each word to allow scrolling
                            }
                        } // VStack
                        .onChange(of: words.count) { _ in
                            // Scroll to the last word
                            value.scrollTo(words.count - 1, anchor: .center)
                        }
                    } // Words HStack
                } // ScrollViewReader
                
                Spacer()
                
//                MorsePreview(currentMorse: $currentLetter)
            } // VStack
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            
            Spacer()
            
            VStack {
                Presser(words: $words, currentLetter: $currentLetter)
            } // VStack
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
        } // Main VStack
        .padding(20)
        .onAppear {
            startBlinkingCursor()
        }
    }
    
    // Timer to toggle the blinking cursor
    func startBlinkingCursor() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            Task { @MainActor in
                withAnimation {
                    showBlinkingCursor.toggle()
                }
            }
        }
    }
}

// Custom view for the blinking cursor
struct BlinkingCursor: View {
    @Binding var show: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 2, height: 30)
            .opacity(show ? 1 : 0) // Blinking effect
    }
}
