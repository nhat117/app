/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” from Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/
import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = ThemeEnum.darkMode
    @Binding var isPresenting: Bool  // Controls the presentation of the QuizView
    var quizData: QuizData  // Contains the questions and answers for the quiz
    @State private var currentQuestionIndex = 0  // Tracks the current question being displayed
    @State private var selectedOptionID: Int?  // Tracks the user's selected answer
    @State private var isAnswered = false  // Indicates whether the current question has been answered
    @State private var showCongratsView = false  // Controls the presentation of the congratulatory view upon quiz completion
    let buttonLabel = ["A", "B", "C", "D"]  // Labels for answer options
    let backgroundColor = CustomColor().backgroundColor  // Background color for the view

    // Back button UI component
    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()  // Dismisses the QuizView
            }
        }) {
            Image(systemName: "arrow.left")
                .font(.system(size: 22))
                .foregroundColor(.black)
                .padding(.all, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 3)
        }
        .padding(.vertical)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Color.clear.frame(height: 20)
                    
                    // Displays the current question number
                    Text("Question \(currentQuestionIndex + 1)")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundStyle(CustomColor().header)
                    
                    // Question text display
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(height: 150)
                            .shadow(radius: 5)
                        
                        Text(quizData.questionsBank2.questions[currentQuestionIndex].text)
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                            .bold()
                    }
                    .padding()
                    
                    // Option buttons for the current question
                    VStack(spacing: 20) {
                        ForEach(Array(zip(buttonLabel.indices, quizData.questionsBank2.questions[currentQuestionIndex].options)), id: \.0) { index, option in
                            CustomButtonQuiz(
                                letter: buttonLabel[index],
                                number: option.text,
                                action: {
                                    answerSelected(option.id)  // Handles answer selection
                                },
                                gradientColors: [Color.purple, Color.blue],
                                borderColor: getBorderColor(forOptionID: option.id, correctOptionID: quizData.questionsBank2.questions[currentQuestionIndex].correctOptionID)  // Determines border color based on answer correctness
                            )
                        }
                    }
                    .padding()
                    
                    // Navigation to CongratsView upon completing all questions
                    NavigationLink(destination: CongratsView(isPresenting: $isPresenting), isActive: $showCongratsView) {
                        EmptyView()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 20) {
                        backButton
                    }
                }
            }
        }
    }

    // Handles the logic when an answer is selected
    func answerSelected(_ optionID: Int) {
        selectedOptionID = optionID
        isAnswered = true
        
        // Advances to the next question or concludes the quiz after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if currentQuestionIndex < quizData.questionsBank2.questions.count - 1 {
                currentQuestionIndex += 1
                selectedOptionID = nil
                isAnswered = false
            } else {
                showCongratsView = true  // Triggers the transition to the congratulatory view
            }
        }
    }

    // Determines the border color of answer options based on their correctness and selection status
    func getBorderColor(forOptionID optionID: Int, correctOptionID: Int) -> Color {
        guard let selectedOptionID = selectedOptionID else {
            return Color.clear
        }

        if selectedOptionID == correctOptionID {
            return optionID == selectedOptionID ? Color.green : Color.clear
        } else {
            if optionID == selectedOptionID {
                return Color.red
            } else if optionID == correctOptionID {
                return Color(red: 124/255, green: 226/255, blue: 139/255)
            } else {
                return Color.clear
            }
        }
    }
}

 #Preview {
     QuizView(isPresenting: .constant(true), quizData: QuizData())
 }
