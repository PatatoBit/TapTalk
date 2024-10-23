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
            VStack {
                Text("TapTalk").font(.largeTitle).bold()
                Text("learn and communicate by tapping")
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: LessonsView()) {
                        Text("Lessons")
                    }
                    
                    Spacer()
                    NavigationLink(destination: TranslateView()) {
                        Image(systemName: "bubble")
                            .font(.system(size: 30))
                            .padding(15)
                            .background(Circle()
                                .stroke(Color("Primary"), lineWidth: 2.5))
                    }
                    
                    Spacer()
                    NavigationLink(destination: PracticeView()) {
                        Text("Practice")
                    }
                    
                    Spacer()
                }
            }
        }
        .background(Color("Background").ignoresSafeArea())
    }
}

#Preview {
    HomeView()
}
