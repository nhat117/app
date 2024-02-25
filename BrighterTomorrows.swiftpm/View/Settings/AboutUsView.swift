import SwiftUI

struct AboutUsView: View {
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
            ScrollView {
                VStack(spacing: 0) {
                    Text("Empower, Protect, Prevent: Building a Safer Future for Every Child")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                    
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 70)
                     .padding(.vertical)
                    
                    Text("Brighter Tomorrow is an innovative app designed to prevent child abuse by educating and empowering Vietnamese communities. Taking advanges of wide digital network, we are able to deliver our lessons to raise their awareness related to domestic violence, and also offer resources for prevention and support. Join the movement towards a safer future for children.")
                        .font(.system(size: 16, weight: .medium))
                        .lineSpacing(4)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.white)

                        Text("MEET THE TEAM")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                        
                        Image(systemName: "arrow.down")                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 60)
                    .background(Color("secondary"))
                    .padding(.top)
                    
                    VStack {
                        Image("nhat_avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .clipShape(Circle())
                            .padding(.top)
                        
                        Text("Nhat Bui")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("primary"))
                        
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12)
                                .foregroundStyle(.white)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 2)

                            Text("Program Tutor")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 2)

                        }
                        .frame(width: 120)
                        .background(.gray)
                        
                        Text("Software Engineering Student\nat RMIT University Vietnam")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("caption_color"))
                            .padding(.bottom, 50)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    VStack {
                        Text("Copyright © 2024 Brighter Tomorrow. \nAll rights reserved.")
                            .foregroundColor(Color("text_color"))
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                    }
                } // VStack
            }
        } // ZStack
        .navigationTitle("About Us")
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
    AboutUsView()
}
