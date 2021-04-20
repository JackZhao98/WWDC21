//
//  MessageView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/15/21.
//

import SwiftUI

struct RowView: View {
    var chat: Chat
    let profileSize: CGFloat = 55
    let rowHeight: CGFloat = 90
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundColor(Color(UIColor(rgb: 0x161616)))
//                .foregroundColor(Color.gray.opacity(0.2))
                .frame(maxWidth: .infinity, minHeight: rowHeight)
            HStack (spacing: 20) {
                chat.profile
                    .resizable()
                    .frame(width: profileSize, height: profileSize)
                    .foregroundColor(Color.gray)
                VStack (alignment: .leading, spacing: 12) {
                    Text(chat.senderName)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(chat.conversations.last?.content ?? "")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.white.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: rowHeight)
    }
}

struct DetailChatView: View {
    @Binding public var data: Chat?
    
    let maxWidth: CGFloat = 400
    let topBarBackground = Color(UIColor(rgb: 0x262626))
    let chatBackground: Color = Color(UIColor(rgb: 0x161616))
    
    public var body: some View {
        ZStack {
            VStack (spacing: 0) {
                HStack {
                    Button (action: {
                        data = nil
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    Text("\(data?.senderName ?? "Unknown")")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(self.topBarBackground)
                
                
                if data != nil {
                    VStack (spacing: 0) {
                        ScrollViewReader { reader in
                            ScrollView {
                                VStack (alignment: .leading, spacing: 20) {
                                    ForEach(self.data!.conversations) { m in
                                        if m.timeBefore != "" {
                                            HStack {
                                                Spacer()
                                                Text(m.timeBefore)
                                                    .foregroundColor(.gray)
                                                Spacer()
                                            }
                                        }
                                        
                                        if m.position {
                                            HStack (alignment: .bottom) {
                                                data!.profile
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 35)
                                                    .foregroundColor(Color.gray)
                                                    .padding(.trailing, 5)
                                                    
                                                Text(m.content)
                                                    .font(.system(size: 18))
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(.white)
                                                    .padding()
                                                    .background(Color.blue)
                                                    .clipShape(MessageBubble(leftPositionMessage: true))
                                                Spacer()
                                            }
                                        }
                                        else {
                                            HStack {
                                                Spacer()
                                                Text(m.content)
                                                    .font(.system(size: 18))
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(Color(UIColor.label))
                                                    .padding()
                                                    .background(Color(UIColor.systemGray4))
                                                    .clipShape(MessageBubble(leftPositionMessage: false))
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, 20)
                                .padding(.horizontal, 25)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        }
                    }
                    .background(chatBackground)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}


public struct MessageView: View {
    @Binding var currentApp: App
    @State var allChat: [Chat] = Chat.appData
    @State var openedMessage: Chat? = nil
    @Binding var progress: Int
    public var body: some View {
        ZStack {
            VStack (spacing: 20) {
                HStack {
                    Button(action: {
                        currentApp = .HOME
                    }) {
                        Label("Home", systemImage: "chevron.backward")
                            .font(.title3)
                    }
                    Spacer()
                }
                
                ScrollView {
                    HStack {
                        Text("Messages")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                        .padding(.bottom)
                    
                    VStack (spacing: 15) {
                        ForEach(self.allChat) { chat in
                            Button(action: {
                                withAnimation {
                                    openedMessage = chat
                                    if chat.senderName == "Jimmy Woo" && progress == 2{
                                        progress = 3
                                    }
                                }
                            }) {
                                RowView(chat: chat)
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            if openedMessage != nil {
                DetailChatView(data: $openedMessage)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
        .background(Color.black)
    }
}

func getMessages(num: Int) -> [Message] {
    switch num {
    case 1:
        return []
    case 2:
        return []
    case 3:
        return [
            Message(content: "Congratulations! You have won the 1 MILLION lottery! Click link to redeem: bit.ly/3sF2A"),
            Message(content: "p.s. *Definitely* not a SCAM!!!!"),
            Message(content: "You have: 1 Attachment"),
        ]
    default:
        return []
    }
}
