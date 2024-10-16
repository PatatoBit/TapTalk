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
                HStack {
                    ForEach(morseStrings, id:\.self) { morse in
                        Text("\(morse)")
                    }
                }
            } // VStack
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
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
    }
}
