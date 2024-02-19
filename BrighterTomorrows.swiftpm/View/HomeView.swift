//
//  SwiftUIView.swift
//  
//
//  Created by Trí Lai on 18/02/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var username = "Iris"
    var body: some View {
        NavigationStack {
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("HI,")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 28, weight: .semibold))

                            Text(username.uppercased())
                                .foregroundStyle(Color("text_color"))
                                .font(.system(size: 40, weight: .bold))
                        }
                        
                        Spacer()
                        
                        Image("tri-avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 60)
                            .shadow(radius: 6)
                    }
                    .padding(.horizontal, 30)
                    
                    VStack {
                        NavigationLink(destination: DetailView()) {
                            TopicCard(title: "Domestic Violence", backgroundColor: Color("red"), imageName: "domestic_violence", topicDesc: "Explore how children are being abused and its preventions")
                        }
                        
                        NavigationLink(destination: DetailView()) {
                            TopicCard(title: "Safety Planning", backgroundColor: Color("blue"), imageName: "domestic_violence")
                        }
                        
                        NavigationLink(destination: DetailView()) {
                            TopicCard(title: "Enquire User emotion", backgroundColor: Color("purple"), imageName: "domestic_violence")
                        }
                        
                        NavigationLink(destination: DetailView()) {
                            TopicCard(title: "Contacts and Resources", backgroundColor: Color("green"), imageName: "domestic_violence")
                        }
                    }
                    
                    Spacer()
                    
                }
            }
        }        
    }
}

#Preview {
    HomeView()
}
