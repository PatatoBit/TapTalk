//
//  SwiftUIView.swift
//  TapTalk
//
//  Created by Pat on 23/10/2567 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("macalert")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                    .padding(.top, 100)

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
