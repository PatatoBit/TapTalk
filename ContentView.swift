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
                    ScrollViewReader { proxy in
                        HStack(spacing: 30) {
                            ForEach(words, id:\.self) { word in
                                HStack(spacing: 3) {
                                    ForEach(word, id:\.self) { letter in
                                        Text(" \(translateMorseToLetter(letter))")
                                            .font(.largeTitle).bold()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                
                Text("\(words)")
                Text(" \(currentLetter)")
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
