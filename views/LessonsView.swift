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
            List {
                ForEach(lessons) { lesson in
                    NavigationLink {
                        Lesson()
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
