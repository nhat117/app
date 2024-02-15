import SwiftUI
//Custom color button 
struct CustomButton: View {
    var letter: String
    var number: String
    var action: () -> Void
    var gradientColors: [Color]

    var body: some View {
        Button(action: action) {
            HStack {
                Text(letter)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .font(.system(size: 30))

                Spacer()

                Text(number)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .font(.system(size: 25))
            }
            .frame(width: 350, height: 70)
            .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 3)
            )
        }
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(letter: "C", number: "You are correct", action: {
            // Perform action on tap
        }, gradientColors: [Color.purple, Color.blue]) // You can change these colors
    }
}
