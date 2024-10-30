//
//  SwiftUIView.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import SwiftUI

struct Lesson: View {
    var letters: [String]
    var words: [String]
    
    var body: some View {
        Text("\(letters)")
        Text("\(words)")
    }
}

#Preview {
    Lesson(letters: ["e", "t"], words: ["tee", "ette"])
}
