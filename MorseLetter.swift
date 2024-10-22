//
//  MorseLetter.swift
//  TouchTalk
//
//  Created by Pat on 19/10/2567 BE.
//

import SwiftUI

struct MorseLetter: View {
    @State var  morseLetter: String = ""
    @State private var isVisible: Bool = false // Track visibility for animation
    
    var body: some View {
        VStack {
            Text("\(translateMorseToLetter(morseLetter))")
                .font(.title)
                .bold()
                .opacity(isVisible ? 1 : 0) // Animate the opacity of the letter
                .animation(.easeInOut(duration: 0.5), value: isVisible)
            
            Text("\(morseLetter)")
                .bold()
                .foregroundStyle(.white)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("Primary")))
                .opacity(isVisible ? 1 : 0) // Animate the opacity of the letter
                .animation(.easeInOut(duration: 0.5), value: isVisible)
        }
        .onAppear {
            isVisible = true
        }
    }
}

#Preview {
    MorseLetter()
}
