/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

enum Theme {
    static let darkMode = false
}

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresentingQuiz = false
    @State private var isPresentingLesson = false
    
    //Storage
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @AppStorage("username") var currentUserName: String?
    
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

                            Text(currentUserName?.split(separator: " ").last?.uppercased() ?? "John Doe")
                                .foregroundStyle(Color("text_color"))
                                .font(.system(size: 40, weight: .bold))
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: SettingView()) {
                            Image("default_user_avatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 60)
                                .shadow(radius: 6)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    ScrollView (showsIndicators: false){
                        NavigationStack {
                           if !isPresentingQuiz {
                               TopicCard(title: "Quiz", backgroundColor: Color("red"), imageName: "quiz_icon")
                               .onTapGesture {
                                   isPresentingQuiz = true
                               }
                           }
                        }.fullScreenCover( isPresented: $isPresentingQuiz){
                            QuizView(isPresenting: $isPresentingQuiz, quizData: QuizData())
                        }
                        
                        NavigationStack {
                           if !isPresentingLesson {
                               TopicCard(title: "Lesson", backgroundColor: Color("blue"), imageName: "lesson_icon").onTapGesture {
                                   isPresentingLesson = true
                               }
                           }
                        }.fullScreenCover( isPresented: $isPresentingLesson){
                            PlaygroundMapView(isPresenting: $isPresentingLesson)

                                .navigationBarTitle("Title", displayMode: .inline)
                        }
                        
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
