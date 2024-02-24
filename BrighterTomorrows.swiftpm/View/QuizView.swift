import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @Binding var isPresenting: Bool
    var quizData: QuizData
    @State private var currentQuestionIndex = 0
    @State private var selectedOptionID: Int?
    @State private var isAnswered = false
    @State private var showCongratsView = false
    let buttonLabel = ["A", "B", "C","D"]
    let backgroundColor = CustomColor().backgroundColor

    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()
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
                    
                    Text("Question \(currentQuestionIndex + 1)")
                        .font(.system(size: 35,weight: .bold, design: .rounded))
                        .foregroundStyle(CustomColor().header)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(height: 150)
                            .shadow(radius: 5)
                        
                        Text(quizData.questionsBank2.questions[currentQuestionIndex].text)
                            .font(.system(size: 23,weight: .bold, design: .rounded))
                            .bold()
                    }
                    .padding()
                    

                    VStack(spacing: 20) {
                        ForEach(Array(zip(buttonLabel.indices, quizData.questionsBank2.questions[currentQuestionIndex].options)), id: \.0) { index, option in
                            CustomButtonQuiz(
                                letter: buttonLabel[index],
                                number: option.text,
                                action: {
                                    answerSelected(option.id)
                                    
                                },
                                gradientColors: [Color.purple, Color.blue],
                                borderColor: getBorderColor(forOptionID: option.id, correctOptionID: quizData.questionsBank2.questions[currentQuestionIndex].correctOptionID)
                            )
                        }
                    }
                    .padding()
                    
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
    func answerSelected(_ optionID: Int) {
            selectedOptionID = optionID
            isAnswered = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if currentQuestionIndex < quizData.questionsBank2.questions.count - 1 {
                    currentQuestionIndex += 1
                    selectedOptionID = nil
                    isAnswered = false
                } else {
                  
                    showCongratsView = true

                }
            }
        }
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

struct MathQuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(isPresenting: .constant(true), quizData:QuizData())
    }
}
