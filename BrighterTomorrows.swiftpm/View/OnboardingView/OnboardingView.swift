/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var onboardingState: Int = 0
    @State private var username: String = ""
    @State private var age: String = ""
    @State private var isUsernameTextClicked: Bool = false
    @State private var isAgeTextClicked: Bool = false
    
    // Alert
    @State private var alertTitle = ""
    @State private var showAlert = false
    @State private var error: CustomError? = nil
    //Storage
    @AppStorage("username") var currentUserName: String?
    @AppStorage("age") var currentUserAge: String?
    @AppStorage("login_state") var signedInSession: Bool = false
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .bottom),
        removal: .move(edge: .bottom))
    
    var body: some View {
        ZStack {
            // Body content
            ZStack {
                switch (onboardingState) {
                case 0:
                    nameSection
                        .transition(transition)
                case 1:
                    ageSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.green)
                }
            }
            
            // Next button
            VStack {
                Spacer()
                if (onboardingState == 0 && !username.isEmpty) ||
                    (onboardingState == 1 && !age.isEmpty) {
                    bottomButton
                }
            }
            .padding()
        }
    }
}

extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Next" :
                onboardingState == 1 ? "Finish" : "Done")
            .font(.system(size: 35))
            .foregroundStyle(Color("primary"))
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .onTapGesture {
                gotoNextPage()
            }
            .alert(isPresented: $showAlert, error: error, actions: {_ in
                Button("OK", role: .cancel) {
                    dismiss()
                }
            }, message: { error in
                Text(error.suggestion ?? "Try again.")
            })
    }
    
    private var ageSection: some View {
        return NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                
                Image(systemName: "123.rectangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundStyle(Color("primary"))
                
                // Greeting message
                Text("How about your ")
                
                // Check tappable text to show text field
                if isAgeTextClicked {
                    TextField("age", text: $age)
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .autocorrectionDisabled(true)
                        .textContentType(.name)
                        .keyboardType(.numberPad)
                    
                } else {
                    // Show tappable text by default
                    Button(role: .none) {
                        withAnimation {
                            isAgeTextClicked.toggle()
                        }
                    } label: {
                        Text("age ?")
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                }
                
                Spacer()
                
            } // VStack
            .font(.largeTitle)
            .lineSpacing(10.0)

        } // NavigationStack
        .navigationBarBackButtonHidden(true)

    }
    
    private var nameSection: some View {
        return NavigationStack {
            VStack(alignment: .leading, spacing: 25.0) {
                Spacer()
                
                Image(systemName: "person.crop.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundStyle(Color("primary"))
                
                // Greeting message
                Text("Hi 👋\n") +
                Text("Please tell us a little bit about ")
                
                // Check tappable text to show text field
                if isUsernameTextClicked {
                    TextField("name", text: $username)
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .offset(x: 135,y: -70)
                        .autocorrectionDisabled(true)
                        .textContentType(.name)

                } else {
                    // Show tappable text by default
                    Button(role: .none) {
                        withAnimation { isUsernameTextClicked.toggle() }
                    } label: {
                        Text("your name")
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                    .offset(x: 135,y: -68)
                }
                
                Spacer()

            } // VStack
            .font(.largeTitle)
            .lineSpacing(10.0)
            

        } // NavigationStack
        .navigationBarBackButtonHidden(true)
    }
}

extension OnboardingView {
    func signIn() {
        currentUserName = username
        currentUserAge = age
        
        withAnimation(.smooth) {
            signedInSession = true
        }
    }
    
    func gotoNextPage() {
        switch onboardingState {
        case 0:
            if username.count < 2 {
                showAlert.toggle()
                error = .nameTooShort
                return
                
            } else if username.count > 20 {
                showAlert.toggle()
                error = .nameTooLong
                return
            }
        
        case 1:
            if Int(age)! < 10 {
                showAlert.toggle()
                error = .ageTooYoung
                return

            } else if Int(age)! > 25 {
                showAlert.toggle()
                error = .ageTooOld
                return
            }
            
        default:
            break
        }
        
        if onboardingState == 1 {
            signIn()
        } else {
            withAnimation(.smooth) {
                onboardingState += 1
            }
        }
    }
}

#Preview {
    OnboardingView().background(Color.white)
}
