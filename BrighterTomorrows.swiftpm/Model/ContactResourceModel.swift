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
import Foundation

struct ContactResourceModel : Identifiable {
    var id  = UUID()
    var name: String
    var image: String
    var contactNumber: String
    var address: String
    var desc: String
}

struct ContactResourceData {
    let contactResourceData: [ContactResourceModel] = [
        ContactResourceModel(
            name: "National Child Helpline",
            image: "child_helpline_111_vietnam",
            contactNumber: "111",
            address: "no.35 Tran Phu street, Ba Dinh district, Hanoi",
            desc: "National Child Helpline 111 is a specialized public service established under the provisions of the Children's Law in 2016. With three numbers 111 which is short and easy to remember, this hotline directly receives and processes information, reports and denuncations on risks and acts of child abuse."),
        
       ContactResourceModel(
            name: "Unicef Help Line",
            image: "unicef_for_every_child",
            contactNumber: "+84 (028) 3.821.9413",
            address: "Unit 507, Sun Wah Tower, 115 Nguyen Hue, District 1, Ho Chi Minh city – Vietnam",
            desc: "UNICEF Viet Nam is one of more than 190 offices of the United Nations Children’s Fund globally and part of the United Nations system in Viet Nam working in close collaboration with all UN agencies in the country. Guided by the Convention on the Rights of the Child, UNICEF has a universal mandate to promote and protect the rights of all children, everywhere – especially those hardest to serve and most at risk."),        
       ContactResourceModel(
            name: "Vietnam Police Department",
            image: "hcm_police_logo",
            contactNumber: "113",
            address: "n.o 268, Tran Hung Dao st, Nguyen Cu Trinh ward, District 1, Ho Chi Minh city",
            desc: "The Ho Chi Minh City Police has the responsibility of safeguarding national security and maintaining social order and safety."),
        
    ]
}
