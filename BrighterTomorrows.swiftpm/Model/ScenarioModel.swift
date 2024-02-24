struct Scenario {
    let id: Int
    let title: String
    let description: String
    let choices: String
}

struct ScenarioData {
    let scenarios1 = [
        Scenario(id: 1,
                 title: "Personal Boundaries",
                 description: "Alex playing in the park when another child asks about something personal.",
                 choices:
                    " Alex Feel uncomfortable and decide to talk to a trusted adult."),
        
        Scenario(id: 2,
                 title: "Good vs. Bad Secrets",
                 description: "Alex is told a secret by a friend that makes Alex feel uneasy.",
                 choices:
                    "Decide to talk to a trusted adult because the secret is worrying."),
        
        Scenario(id: 3,
                 title: "Speaking Up",
                 description: "Someone Alex knows does something that makes Alex feel uncomfortable.",
                 choices: "Seek a safe adult to share feelings and what happened."),
        
        // Previous scenarios 4, 5, and 6 as defined earlier...
        Scenario(id: 4,
                 title: "Understanding Personal Space",
                 description: "During a school activity, a classmate gets too close to Alex, making Alex feel uncomfortable.",
                 choices: "Ask the classmate for more space, explaining personal space."),
        
        Scenario(id: 5,
                 title: "Trusting Gut Feelings",
                 description: "Alex is walking home and is offered a ride by someone Alex barely knows.",
                 choices: "Call a family member to discuss the situation and seek advice."),
        
        Scenario(id: 6,
                 title: "Dealing with Peer Pressure",
                 description: "Some of Alex's friends are doing something that feels wrong.",
                 choices:"Excuse yourself and talk to a trusted adult about feeling pressured.")
    ]
}

