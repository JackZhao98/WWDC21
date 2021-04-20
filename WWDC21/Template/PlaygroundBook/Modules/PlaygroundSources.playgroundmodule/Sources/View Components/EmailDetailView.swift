//
//  EmailDetailView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/17/21.
//

import SwiftUI

struct EmailDetailView: View {
    @Binding var content: Email?
    @Binding var progress: Int
    let contentColor: Color = Color(UIColor(rgb: 0x262626))
    
    @State var showAttachment: Bool = false
    var body: some View {
        ZStack {
            Color.black
            
            ZStack {
                VStack (alignment: .leading) {
                    HStack {
                        Spacer()
                        Button (action: {
                            content = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                    }
                    .padding(.top, 16)
                    HStack {
                        Text(content?.subject ?? "Untitled")
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .fontWeight(.semibold)
                        Spacer()
                        Text(content?.time ?? "1970-01-01")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 6)
                    HStack {
                        VStack (alignment: .trailing) {
                            Text("From: ")
                                .font(.system(size: 18))
                            Text("To: ")
                                .font(.system(size: 18))
                        }
                        .foregroundColor(.white)
                        VStack (alignment: .leading) {
                            Text(content?.sender ?? "Sender")
                                .font(.system(size: 18))
                                .foregroundColor(.blue)
                            Text(content?.recipient ?? "Recipient")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                            
                        }
                    }
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    
                    Text(content?.content ?? "no content")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                    
                    if content?.attachmentName != "" {
                        Button(action: {
                            if progress == 4 && self.content!.sender == "jimmy.woo@fbi.com" {
                                progress = 5
                            }
                            withAnimation {
                                self.showAttachment.toggle()
                            }
                            
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 3)
                                
                                HStack {
                                    Image(systemName: "doc.text.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.gray)
                                    Spacer()
                                    VStack (alignment: .leading) {
                                        Text(content?.attachmentName ?? "Attachment")
                                            .font(.system(size: 16))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text("Tap to open")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .frame(width: 200, height:90)
                            }
                            .frame(width: 200, height:90)
                        }
                        .padding(.vertical)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 25)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(contentColor)
            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
            .padding(20)
            .blur(radius: showAttachment ? 5.0 : 0.0)
            .onTapGesture {
                withAnimation {
                    showAttachment = false
                }
            }
            
            if showAttachment {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .frame(width: 250, height: 250)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .overlay(
                        VStack (spacing: 35) {
                            Image(systemName: "multiply")
                                .font(.system(size: 50, design: .rounded))
                                .foregroundColor(Color(UIColor.systemGray5))
                            Text("File Damaged")
                                .font(.system(.largeTitle, design: .rounded))
                                .foregroundColor(Color(UIColor.systemGray5))
                        })
            }
        }
    }
}
