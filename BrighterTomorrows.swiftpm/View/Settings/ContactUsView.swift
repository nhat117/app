import SwiftUI

struct ContactUsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("If you have any inquiries, get in touch with us. We will be happy to help you.")
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .foregroundStyle(Color("text_color_secondary"))
                    .font(.system(size: 16, weight: .semibold))
                            
                ContactCard(imageIcon: "phone.fill", useSystemImage: true, contactName: "Phone number", contactInfo: "(+84) 069 123 456")
                
                ContactCard(imageIcon: "envelope.fill", useSystemImage: true, contactName: "Email address", contactInfo: "s3878174@rmit.edu.vn")
                
                ContactGroupCard(contactList: myContact, contactGroupName: "Social Media")
                
                Spacer()
            }
        }
        .navigationTitle("Contact Us")
        .navigationBarTitleDisplayMode(.large)
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
    ContactUsView()
}
