//
//  EmailView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/17/21.
//

import SwiftUI

struct EmailView: View {
    @Binding var currentApp: App
    @State var displayedEmail: Email? = nil
    @Binding var progress: Int
    
    var body: some View {
        ZStack {
            Color.black
            VStack (alignment: .leading) {
                HStack {
                    if displayedEmail == nil {
                        Button (action: {
                            currentApp = .HOME
                        }) {
                            Label("Home", systemImage: "chevron.backward")
                                .font(.title3)
                        }
                    } else {
                        Button (action: {
                            displayedEmail = nil
                        }) {
                            Label("Back", systemImage: "chevron.backward")
                                .font(.title3)
                        }
                    }
                    Spacer()
                }
                .padding(.bottom)
                
                Text("All Inboxes")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    
                Divider()
                    .background(Color.white)
                    .padding(.bottom, 20)
                    .padding(.horizontal)
                
                ScrollView  {
                    VStack (spacing: 10) {
                        ForEach(Email.allEmails) { email in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .frame(height: 150)
                                    .foregroundColor(Color(UIColor(rgb: 0x161616)))
                                
                                VStack (alignment: .leading, spacing: 5) {
                                    HStack {
                                        Text(email.sender)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .bold()
                                        Spacer()
                                        Text(email.time)
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                        
                                    }
                                    Text(email.subject)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    Text(email.preview)
                                        .font(.system(size: 20))
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                        
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .frame(height: 150)
                            .onTapGesture {
                                withAnimation {
                                    displayedEmail = email
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            if displayedEmail != nil {
                EmailDetailView(content: $displayedEmail, progress: self.$progress)
            }
        }
    }
}
