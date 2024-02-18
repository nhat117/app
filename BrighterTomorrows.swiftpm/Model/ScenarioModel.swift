struct Scenario {
    let id: Int
    let title: String
    let description: String
    let choices: [String]
}

let scenarios1 = [
    Scenario(id: 1,
             title: "Personal Boundaries",
             description: "Alex is playing in the park when another child asks about something personal.",
             choices: ["Kindly say, 'Let's play something else!'",
                       "Feel uncomfortable and decide to find a trusted adult to talk to."]),

    Scenario(id: 2,
             title: "Good vs. Bad Secrets",
             description: "Alex is told a secret by a friend that makes Alex feel uneasy.",
             choices: ["Keep the secret to be a good friend.",
                       "Decide to talk to a trusted adult because the secret is worrying."]),

    Scenario(id: 3,
             title: "Speaking Up",
             description: "Someone Alex knows does something that makes Alex feel uncomfortable.",
             choices: ["Remember it's important to say 'no' and decide to speak up.",
                       "Seek a safe adult to share feelings and what happened."]),

    // Previous scenarios 4, 5, and 6 as defined earlier...
    Scenario(id: 4,
             title: "Understanding Personal Space",
             description: "During a school activity, a classmate gets too close to Alex, making Alex feel uncomfortable.",
             choices: ["Ask the classmate for more space, explaining personal space.",
                       "Move to a different spot and plan to talk to the teacher about personal space."]),

    Scenario(id: 5,
             title: "Trusting Gut Feelings",
             description: "Alex is walking home and is offered a ride by someone Alex barely knows.",
             choices: ["Kindly decline the ride, sticking to trusted family or friends.",
                       "Call a family member to discuss the situation and seek advice."]),

    Scenario(id: 6,
             title: "Dealing with Peer Pressure",
             description: "Some of Alex's friends are doing something that feels wrong.",
             choices: ["Choose not to participate and suggest another fun and safe activity.",
                       "Excuse yourself and talk to a trusted adult about feeling pressured."])
]

let scenarios2 = [
    Scenario(id: 1,
             title: "A Lesson in Kindness",
             description: "In Safe Haven, Alex witnesses harsh words between villagers. With a belief in the power of kindness, Alex steps in to mend the situation.",
             choices: ["Explain the importance of kind words", "Encourage a group activity to lighten the mood"]),

    Scenario(id: 2,
             title: "The Family Gathering",
             description: "At a family gathering, Alex sees a relative dominating others. Alex decides to introduce a game focusing on cooperation and listening.",
             choices: ["Start a cooperative game", "Lead a discussion on the value of every voice"]),

    Scenario(id: 3,
             title: "Teamwork Triumphs",
             description: "During the annual team-building event, Alex emphasizes teamwork and respect, guiding their team towards a meaningful victory.",
             choices: ["Demonstrate teamwork in action", "Share stories of successful teamwork"]),

    Scenario(id: 4,
             title: "The Approaching Storm",
             description: "As a storm threatens Safe Haven, Alex helps enact a safety plan, ensuring every villager knows where to go and how to stay safe.",
             choices: ["Organize villagers according to the safety plan", "Reassure and guide villagers to safety"]),

    Scenario(id: 5,
             title: "After the Storm",
             description: "Post-storm, some villagers feel disheartened. Alex listens to their concerns, sharing empathy and stories of resilience.",
             choices: ["Listen and empathize with the villagers", "Organize a community rebuilding effort"]),

    Scenario(id: 6,
             title: "Resolving Conflict",
             description: "When a disagreement arises, Alex seeks the elders' wisdom, helping to mediate the conflict with empathy and respect.",
             choices: ["Facilitate a peaceful discussion", "Encourage empathy by sharing personal experiences"]),

    Scenario(id: 7,
             title: "The Beacon of Hope",
             description: "Through every challenge in Safe Haven, Alex remains a beacon of hope, teaching the importance of preparedness, empathy, and understanding.",
             choices: ["Share the lessons learned with others", "Organize a celebration of the village's resilience"])
]
