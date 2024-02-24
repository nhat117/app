//
//  SwiftUIView.swift
//  
//
//  Created by Trí Lai on 18/02/2024.
//

import SwiftUI

enum Theme {
    static let darkMode = false
}

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @State private var isPresentingQuiz = false
    @State private var isPresentingLesson = false
    @State private var username = "Iris"
    
    @AppStorage("username") var currentUserName: String?
        
//    var backButton: some View {
//        Button(action: {
//            withAnimation() {
//                presentationMode.wrappedValue.dismiss()
//            }
//        })  {
//            RoundedRectangle(cornerRadius: 25.0)
//                .fill(Color("secondary"))
//                .frame(width: 50, height: 30)
//                .overlay(alignment: .center, content: {
//                    Image(systemName: "arrow.backward")
//                        .font(.system(size: 20, weight: .heavy))
//                        .foregroundColor(isDarkMode ? .black : .white)
//                })
//        }
//        .contentShape(Circle())
//    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {                                
                        VStack(alignment: .leading) {
                            Text("HI,")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 28, weight: .semibold))

                            Text(currentUserName.uppercased())
                                .foregroundStyle(Color("text_color"))
                                .font(.system(size: 40, weight: .bold))
                        }
                        
                        Spacer()
                        
                        Image("tri-avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 60)
                            .shadow(radius: 6)
                    }
                    .padding(.horizontal, 30)
                    
                    VStack {
                        NavigationStack {
                                   if !isPresentingQuiz {
                                       // Your HomeView content
                                       TopicCard(title: "Quiz", backgroundColor: Color("red"), imageName: "domestic_violence").onTapGesture {
                                           isPresentingQuiz = true
                                       }
                                   } 
                        }.fullScreenCover( isPresented: $isPresentingQuiz){
                            QuizView(isPresenting: $isPresentingQuiz, quizData: QuizData())
                        }
 
                        
                        
                        NavigationStack {
                                   if !isPresentingLesson {
                                       // Your HomeView content
                                       TopicCard(title: "Lesson", backgroundColor: Color("blue"), imageName: "domestic_violence").onTapGesture {
                                           isPresentingLesson = true
                                       }
                                   }
                        }.fullScreenCover( isPresented: $isPresentingLesson){
                            PlaygroundMapView(isPresenting: $isPresentingLesson)
                        }
                        
                        NavigationLink(destination: EmotionView()) {
                            TopicCard(title: "Enquire User emotion", backgroundColor: Color("purple"), imageName: "domestic_violence")
                        }
                        
//                        NavigationLink(destination: EmotionHistoryView()) {
//                            TopicCard(title: "Emotion Diary", backgroundColor: Color("purple"), imageName: "domestic_violence")
//                        }
                        
                        NavigationLink(destination: QuizView(isPresenting: $isPresentingQuiz, quizData: QuizData())) {
                            TopicCard(title: "Contacts and Resources", backgroundColor: Color("green"), imageName: "domestic_violence")
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
