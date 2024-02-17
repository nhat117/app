//
//  QuizView.swift
//  BrighterTomorrows
//
//  Created by Nhat Bui Minh on 2/15/24.
//

import SwiftUI

struct MathQuizView: View {
    // Define the question and answers
    let question: String = "3 + 5"
    let answers = ["12", "4", "8", "10"]
    let button = ["A","B","C", "D"]
    let backgroundColor = Color(red: 76 / 255, green: 198 / 255, blue: 222 / 255)

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background color
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                // Action for the back button
            }) {
                Image(systemName: "arrow.left") // Use a system image for the back arrow
                    .font(.system(size: 24)) // Set the font size to make the arrow larger
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white) // Semi-transparent background
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                    .shadow(radius: 3)
            }
            .padding() // Add padding to move the button a bit from the edges
            // Vertical stack for the card and buttons
            VStack(spacing: 20) {
                Color.clear.frame(height: 50)
                Text("Question 1").font(.system(size: 35,weight: .bold)).foregroundStyle(Color(red: 5 / 255, green: 92 / 255, blue: 111 / 255))
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
    }
}

struct MathQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MathQuizView()
    }
}
