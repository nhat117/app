//
//  Data.swift
//  BrighterTomorrows
//
//  Created by Nhat Bui Minh on 2/14/24.
//
import Foundation

struct Question {
    let text: String
    let options: [Option]
    let correctOptionID: Int
}

struct Option {
    let id: Int
    let text: String
}

struct Quiz {
    let title: String
    let questions: [Question]
}

struct UserAnswer {
    let question: Question
    let selectedOption: Option
}


let questionsBank1 = Quiz(
    title: "Understanding and Safety",
    questions: [
        Question(
            text: "What is abuse?",
            options: [
                Option(id: 1, text: "Showing kindness to someone"),
                Option(id: 2, text: "Mistreating someone in various forms"),
                Option(id: 3, text: "Sharing things with friends"),
                Option(id: 4, text: "Helping someone in need")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "Who can be an abuser?",
            options: [
                Option(id: 1, text: "Only strangers"),
                Option(id: 2, text: "Only teachers"),
                Option(id: 3, text: "Family members or well-known people"),
                Option(id: 4, text: "Only friends")
            ],
            correctOptionID: 3
        ),
        Question(
            text: "What is domestic abuse?",
            options: [
                Option(id: 1, text: "Arguments between siblings"),
                Option(id: 2, text: "A pattern of controlling behavior in a family"),
                Option(id: 3, text: "Disagreements between friends"),
                Option(id: 4, text: "Misunderstanding between classmates")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "What can a healthy relationship provide?",
            options: [
                Option(id: 1, text: "Confusion and fear"),
                Option(id: 2, text: "Belonging and value"),
                Option(id: 3, text: "Isolation and loneliness"),
                Option(id: 4, text: "Misunderstandings and conflicts")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "What is an important aspect of a healthy relationship?",
            options: [
                Option(id: 1, text: "Competition"),
                Option(id: 2, text: "Jealousy"),
                Option(id: 3, text: "Respect"),
                Option(id: 4, text: "Secrets")
            ],
            correctOptionID: 3
        ),
        Question(
            text: "What should you do if you don't feel safe at home?",
            options: [
                Option(id: 1, text: "Keep it a secret"),
                Option(id: 2, text: "Know how to call for help"),
                Option(id: 3, text: "Stay close to the danger"),
                Option(id: 4, text: "Handle it yourself")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "What is NOT a sign of a healthy relationship?",
            options: [
                Option(id: 1, text: "Trust"),
                Option(id: 2, text: "Gossiping about each other"),
                Option(id: 3, text: "Feeling safe"),
                Option(id: 4, text: "Mutual respect")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "Why is empathy important in a relationship?",
            options: [
                Option(id: 1, text: "It allows you to ignore others' feelings"),
                Option(id: 2, text: "It involves putting yourself in someone else's shoes"),
                Option(id: 3, text: "It encourages keeping secrets"),
                Option(id: 4, text: "It means making fun of others")
            ],
            correctOptionID: 2
        ),
        Question(
            text: "What should you avoid if there's a fight at home?",
            options: [
                Option(id: 1, text: "Staying out of the fight"),
                Option(id: 2, text: "Joining in to take sides"),
                Option(id: 3, text: "Hiding in a small, unsafe place"),
                Option(id: 4, text: "Ignoring the situation")
            ],
            correctOptionID: 1
        ),
        Question(
            text: "How can you prepare for an unsafe situation at home?",
            options: [
                Option(id: 1, text: "Memorize your favorite TV show's schedule"),
                Option(id: 2, text: "Know your address and a safe place to go"),
                Option(id: 3, text: "Learn all the video game cheats"),
                Option(id: 4, text: "Practice hiding skills")
            ],
            correctOptionID: 2
        )
    ]
)

//Question banks 2

