//
//  SwiftUIView.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import SwiftUI

struct PracticeWords: View {
    @Binding var  currentStage: Int
    var words: [String]
    
    var body: some View {
        Text("\(words)")
        
        Button("Next") {
            currentStage += 1
        }
    }
}
