import SwiftUI
struct CustomButtonQuiz: View {
    var letter: String
    var number: String
    var action: () -> Void
    var gradientColors: [Color]
    var borderColor: Color

    var body: some View {
        Button(action: action) {
            HStack {
                Text(letter)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .font(.system(size: 25))

                Spacer()

                Text(number)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .font(.system(size: 20))
            }
            .frame(width: 350, height: 70)
            .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor, lineWidth: 5)
            )
        }
    }
}
