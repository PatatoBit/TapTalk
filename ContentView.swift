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
    @State var morseStrings: [String] = []
    
    var body: some View {
        VStack {
            VStack {
//                ScrollView(.horizontal) {
//                    ScrollViewReader { proxy in
//                        HStack {
//                            ForEach(morseStrings, id:\.self) { morse in
//                                Text("\(morse)").font(.largeTitle)
//                            }
//                            .onChange(of: morseStrings.count) { _ in
//                                proxy.scrollTo(morseStrings.count - 1)
//                            }
//                        }
//                    }
//                }
                
                Text("\(morseStrings)")
            } // VStack
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            
            Spacer()
            
            VStack {
                Presser(morseStrings: $morseStrings)
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
