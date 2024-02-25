import SwiftUI

struct ContactAndResource: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
