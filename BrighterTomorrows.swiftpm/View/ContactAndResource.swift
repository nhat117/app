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
import SwiftUI

struct ContactAndResource: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //Storage
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    
    private var contactData: ContactResourceData = ContactResourceData()
    
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
        ZStack (alignment: .topLeading){
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Text("Emergency Contact")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(CustomColor().header)
                ScrollView(showsIndicators: false) {
                    ForEach(contactData.contactResourceData) {contact in
                        ContactCard(
                            name: contact.name,
                            image: contact.image,
                            address: contact.address,
                            desc: contact.desc,
                            contactNumber: contact.contactNumber)
                        .padding()
                    }
                }
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

#Preview {
    ContactAndResource()
}
