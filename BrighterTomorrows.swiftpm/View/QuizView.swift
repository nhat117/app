import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    
    // Define the question and answers
    let question: String = "3 + 5"
    let answers = ["12", "4", "8", "10"]
    let button = ["A","B","C", "D"]
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
        ZStack(alignment: .topLeading) {
            // Background color
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // Vertical stack for the card and buttons
            VStack(spacing: 20) {
                Color.clear.frame(height: 50)
                
                Text("Question 1")
                    .font(.system(size: 35,weight: .bold, design: .rounded))
                    .foregroundStyle(CustomColor().header)
                
                // Question card
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 5)

                    Text(question)
                        .font(.largeTitle)
                        .bold()
                }
                .padding()

                // Answer buttons vertical stack
                VStack(spacing: 20) {
                    ForEach(Array(zip(answers.indices, answers)), id: \.0) { index, answer in
                        CustomButtonQuiz(letter: button[index], number: answer, action: {
                            // Handle answer selection
                        }, gradientColors: [Color.purple, Color.blue]) // You can change these colors
                    }
                }
                .padding()
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

struct MathQuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
