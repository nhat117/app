/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import Foundation

struct Question {
    let text: String
    let options: [Option]
    let correctOptionID: Int
}

struct Option: Identifiable {
    var id: Int
    var text: String
}



struct Quiz {
    let title: String
    let questions: [Question]
}

struct UserAnswer {
    let question: Question
    let selectedOption: Option
}



//Question banks 2
struct QuizData {

    let questionsBank2 = Quiz(
        title: "Understanding Personal Boundaries",
        questions: [
            Question(
                text: "Who is allowed to touch your private parts?",
                options: [
                    Option(id: 1, text: "Anyone if they're just joking"),
                    Option(id: 2, text: "No one without my permission"),
                    Option(id: 3, text: "Family members"),
                    Option(id: 4, text: "Doctors, but only with consent and explanation")
                ],
                correctOptionID: 4
            ),
            Question(
                text: "What should you do if someone asks you to keep an uncomfortable secret?",
                options: [
                    Option(id: 1, text: "Keep the secret"),
                    Option(id: 2, text: "Tell a trusted adult"),
                    Option(id: 3, text: "Forget about it"),
                    Option(id: 4, text: "Laugh it off")
                ],
                correctOptionID: 2
            ),
            Question(
                text: "Is it okay to say 'no' if you're uncomfortable with a hug or kiss?",
                options: [
                    Option(id: 1, text: "Yes, always"),
                    Option(id: 2, text: "No, it's rude"),
                    Option(id: 3, text: "Only to strangers"),
                    Option(id: 4, text: "Only if you're in a bad mood")
                ],
                correctOptionID: 1
            ),
            Question(
                text: "Who can you talk to if you're feeling uncomfortable about something?",
                options: [
                    Option(id: 1, text: "A trusted adult"),
                    Option(id: 2, text: "No one, it's better to keep it to yourself"),
                    Option(id: 3, text: "Only your best friend"),
                    Option(id: 4, text: "Your pet")
                ],
                correctOptionID: 1
            ),
            Question(
                text: "What's the difference between a good secret and a bad secret?",
                options: [
                    Option(id: 1, text: "Good secrets make everyone happy, bad secrets make you sad"),
                    Option(id: 2, text: "There's no difference, all secrets are fun"),
                    Option(id: 3, text: "Good secrets are about presents, bad secrets breaking rules"),
                    Option(id: 4, text: "Good secrets are about surprises, bad secrets are kept from parents")
                ],
                correctOptionID: 1
            )
        ]
    )

}
