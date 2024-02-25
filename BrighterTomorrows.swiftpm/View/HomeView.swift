import SwiftUI

enum Theme {
    static let darkMode = false
}

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @AppStorage("username") var currentUserName: String?

    @State private var isPresentingQuiz = false
    @State private var isPresentingLesson = false
    
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
