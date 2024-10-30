//
//  LessonsView.swift
//  TapTalk
//
//  Created by Pat on 23/10/2567 BE.
//

import SwiftUI

struct LessonsView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("Lessons").font(.title)
            
            List {
                ForEach(lessons) { lesson in
                    NavigationLink {
                        Lesson(letters: lesson.letters, words: lesson.words)
                    } label: {
                        Text("\(lesson.name)")
                    }
                }
            }
        }
    }
}


#Preview {
    LessonsView()
}
