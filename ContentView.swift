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
                
                Text("\(currentLetter)")
                
                HStack {
                    ForEach(words, id:\.self) { word in
                        HStack {
                            ForEach(word, id:\.self) { letter in
                                if letter != "" {
                                    Text("\(letter)")
                                        .font(.title)
                                        .bold()
                                        .foregroundStyle(.white)
                                } else {
                                    Text(" \(currentLetter)")
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.pink))
                        
                    }
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
