//
//  File.swift
//  TouchTalk
//
//  Created by Pat on 16/10/2567 BE.
//

import SwiftUI

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
