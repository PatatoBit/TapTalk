//
//  SwiftUIView.swift
//  TapTalk
//
//  Created by Pat on 23/10/2567 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            HStack {
                Spacer()

                NavigationLink(destination: LessonsView()) {
                    Text("Lesson")
                }
                
                Spacer()
                
                NavigationLink(destination: TranslateView()) {
                    Text("Translate")
                }
                
                Spacer()

                NavigationLink(destination: PracticeView()) {
                    Text("Practice")
                }
                
               Spacer()
            }
        }
        .background(
            Color("Background").ignoresSafeArea()
        )
    }
}

#Preview {
    HomeView()
}
