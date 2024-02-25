/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - UI designs inspired by "Children Learning App" on Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresentingQuiz = false  // Controls the presentation of the QuizView
    @State private var isPresentingLesson = false  // Controls the presentation of the LessonView
    
    // User preferences stored in AppStorage for persistent settings
    @AppStorage("isDarkMode") private var isDarkMode: Bool = ThemeEnum.darkMode
    @AppStorage("username") var currentUserName: String?  // Stores the current user's name for personalization
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("primary")  // Background color for the entire view
                    .ignoresSafeArea()
                
                VStack {
                    // Greeting section that displays a personalized message to the user
                    HStack {
                        VStack(alignment: .leading) {
                            Text("HI,")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 28, weight: .semibold))

                            Text(currentUserName?.split(separator: " ").last?.uppercased() ?? "John Doe")
                                .foregroundStyle(Color("text_color"))
                                .font(.system(size: 40, weight: .bold))
                        }
                        
                        Spacer()
                        
                        // User avatar or profile picture
                        Image("tri-avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 60)
                            .shadow(radius: 6)
                    }
                    .padding(.horizontal, 30)
                    
                    // Scrollable area containing various interactive and educational cards
                    ScrollView(showsIndicators: false) {
                        // Quiz card that navigates to the QuizView when tapped
                        NavigationStack {
                           if !isPresentingQuiz {
                               TopicCard(title: "Quiz", backgroundColor: Color("red"), imageName: "quiz_icon")
                               .onTapGesture {
                                   isPresentingQuiz = true
                               }
                           }
                        }.fullScreenCover(isPresented: $isPresentingQuiz) {
                            QuizView(isPresenting: $isPresentingQuiz, quizData: QuizData())
                        }
                        
                        // Lesson card that navigates to the LessonView when tapped
                        NavigationStack {
                           if !isPresentingLesson {
                               TopicCard(title: "Lesson", backgroundColor: Color("blue"), imageName: "lesson_icon").onTapGesture {
                                   isPresentingLesson = true
                               }
                           }
                        }.fullScreenCover(isPresented: $isPresentingLesson) {
                            PlaygroundMapView(isPresenting: $isPresentingLesson)
                                .navigationBarTitle("Title", displayMode: .inline)
                        }
                        
                        // Additional navigation links to other views such as EmotionView, EmotionHistoryView, and ContactAndResource
                        NavigationLink(destination: EmotionView()) {
                            TopicCard(title: "Enquire User emotion", backgroundColor: Color("purple"), imageName: "emotion_icon")
                        }
                        
                        NavigationLink(destination: EmotionHistoryView()) {
                            TopicCard(title: "Emotion Diary", backgroundColor: Color("dark_red"), imageName: "domestic_violence")
                        }
                        
                        NavigationLink(destination: ContactAndResource()) {
                            TopicCard(title: "Contacts and Resources", backgroundColor: Color("green"), imageName: "phone_icon")
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)  // Hides the default back button in the navigation bar
    }
}

 #Preview {
     HomeView()
 }
