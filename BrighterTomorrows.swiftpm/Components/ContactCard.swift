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
import SwiftUI

struct ContactCard: View {
    var name: String?
    var image: String?
    var address: String?
    var desc: String?
    var contactNumber: String?
    @State private var isExpanded: Bool = false


    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name!).font(.system(size: 18, weight: .bold))
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                        Text(contactNumber!)
                            .font(.system(size: 16))
                    }
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                        Text(address!)
                            .font(.system(size: 14))
                    }
                }
                Spacer()
                
                Image(image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .foregroundColor(.white)
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding(3)
            }
            .padding()

            if isExpanded {
                Text(desc!)
                    .font(.system(size: 18))
                    .padding()
                    .transition(.slide)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .onTapGesture {
            withAnimation {
                isExpanded.toggle() 
            }
        }
    }
}


#Preview {
    ContactCard(name: "RMIT University", image: "rmit_university", address: "701 Nguyen Van Linh", desc: "Lorem ipsum dolor sit amet", contactNumber: "12435235")
}
