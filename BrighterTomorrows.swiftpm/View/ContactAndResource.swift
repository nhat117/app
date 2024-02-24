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
                TabView {
                    ContactCard(
                        name: contactData.contactResourceData[0].name,
                        image: contactData.contactResourceData[0].image,
                        address: contactData.contactResourceData[0].address, 
                        desc: contactData.contactResourceData[0].desc,
                        contactNumber: contactData.contactResourceData[0].contactNumber)

                    ContactCard(
                        name: contactData.contactResourceData[1].name,
                        image: contactData.contactResourceData[1].image,
                        address: contactData.contactResourceData[1].address,
                        desc: contactData.contactResourceData[1].desc,
                        contactNumber: contactData.contactResourceData[1].contactNumber)

                    ContactCard(
                        name: contactData.contactResourceData[2].name,
                        image: contactData.contactResourceData[2].image,
                        address: contactData.contactResourceData[2].address,
                        desc: contactData.contactResourceData[2].desc,
                        contactNumber: contactData.contactResourceData[2].contactNumber)

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
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
