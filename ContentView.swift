import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("Hello, world!").font(.largeTitle).bold()
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            
            Spacer()
            
            Button {
                print("Hello world!")
            } label: {
                Text("")
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.blue)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            
        }
    }
}
