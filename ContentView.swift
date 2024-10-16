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
                Text("\(morseStrings)").font(.largeTitle).bold()
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

struct Presser: View {
    @State private var state: morseState = morseState(state: .inactive)
    @Binding var morseStrings: [String]
    
    var body: some View {
        Button {
            if (self.state.state == .holded) {
                // Execute after a hold
                self.morseStrings.append("-")
                self.state.state = .inactive
            } else {
                // Execute after a short press
                self.morseStrings.append(".")
                self.state.state = .inactive
            }
        } label: {
            Text("")
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
        }
        .buttonStyle(.borderedProminent)
        .foregroundStyle(.blue)
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.1)
            .onEnded({ _ in
                state.state = .holded
            })
        )
    }
}
