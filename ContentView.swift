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
    @State var words: [[String]] = []
    
    @State var currentLetter = ""
    
    var body: some View {
        VStack {
            VStack {
                ScrollView(.horizontal) {
                    ScrollViewReader { value in
                        
                        HStack(spacing: 60) {
                            ForEach(words.indices, id: \.self) { index in
                                HStack(spacing: 10) {
                                    ForEach(words[index], id:\.self) { letter in
                                        VStack {
                                            Text("\(translateMorseToLetter(letter))")
                                                .font(.title)
                                                .bold()
                                            
                                            Text("\(letter)")
                                        }
                                    }
                                } // Letters HStack
                                .id(index) // Add id to each word to allow scrolling
                            }
                        } // Words HStack
                        .onChange(of: words.count) { _ in
                            // Scroll to the last word
                            value.scrollTo(words.count - 1, anchor: .center)
                        }
                        
                    } // ScrollViewReader
                }
                
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
    }
}
