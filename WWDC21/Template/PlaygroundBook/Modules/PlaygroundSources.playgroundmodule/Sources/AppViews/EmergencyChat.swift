//
//  EmergencyChat.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//
import SwiftUI
import PlaygroundSupport

public struct EmergencyChatView: View {
    @State public var progress: Int = 0
    @State public var messages: [Message] = []
    @State public var availableMessages: Int = 0
    
    @State public var buttonContext: [String] = []
    @State public var buttonNextState: [Int] = []
    // True when sending a message
    @State public var sendingMessage: Bool = false
    
    let maxWidth: CGFloat = 400
    let topBarBackground = Color.black.opacity(0.6)
    let chatBackground: Color = Color.black.opacity(0.1)
    public init () {    }
    public var body: some View {
        ZStack {
            VStack (spacing: 0) {
                HStack {
                    Spacer()
                    Text("Emergency Service Contact")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical, 30)
                .background(self.topBarBackground)
                
                VStack (spacing: 0) {
                ScrollViewReader { reader in
                    ScrollView {
                        VStack (alignment: .leading, spacing: 20) {
                            ForEach(self.messages) { m in
                                if m.position {
                                    HStack {
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
                            .onChange(of: self.messages, perform: { value in
                                reader.scrollTo(self.messages.last!.id, anchor: .bottom)
                            })
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 25)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .padding(.bottom, 16)
            
            
            ChatBottomBarView(sending: sendingMessage, current: $progress, buttonContext: self.buttonContext, buttonNextState: self.buttonNextState, backgroundColor: self.chatBackground)
                .padding(.bottom)
                .padding(.horizontal)
            }
            .background(self.chatBackground)
        }
        .onChange(of: self.progress, perform: { value in
            updateMessage()
        })
        .onAppear() {
            updateMessage()
        }
    }
    
    func updateMessage() {
        // Button is pressed
        // Next state is already set
        sendingMessage = true
        // Dispatch Queue: get response text
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages += getResponse(currentState: self.progress, senderResponse: true)
        }
        
        // Dispatch Queue: Get new text and release buttons
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sendingMessage = false
            messages += getResponse(currentState: self.progress, senderResponse: false)
            let newButtonContext = getChoice(currentState: self.progress)
            buttonContext = newButtonContext.0
            buttonNextState = newButtonContext.1
        }
        
        if self.progress == 12 {
            PlaygroundPage.current.assessmentStatus = .pass(message: "Device lock removed! Proceeed to the next page.")
        }
        
    }
}

func getResponse(currentState: Int, senderResponse: Bool) -> [Message] {
    var temp: [Message] = []
    if senderResponse {
        switch currentState {
        case 0:
            break
        case 1: // Honest reponse
            temp = [
                Message(content: "Sorry, I don’t know the answer.", position: false),
                Message(content: "My name is Jack, Jerry’s friend. He’s been missing for days. The police cannot find him yet. This phone is our only clue. ", position: false),
                Message(content: "And...who are you again? Do you know Jerry??", position: false),
            ]
            break
        case 2:
            temp = [
                Message(content: "Doctor Who...I guess?", position: false),
            ]
            break
        case 3:
            temp = [
                Message(content: "The Big Bang Theory? That must be the one!", position: false),
            ]
            break
        case 4:
            temp = [
                Message(content: "We believe the phone may have key information related to his missing. So it would be really helpful if you could unlock this phone for us to find more clues.", position: false),
            ]
            break
        case 5:
            temp = [
                Message(content: "Unlock this phone immediately.", position: false),
            ]
            break
        case 6:
            temp = [
                Message(content: "Seems like I have to try.", position: false),
            ]
            break
        case 7:
            temp = [
                Message(content: "Fine, I’ll play your game.", position: false),
            ]
            break
        case 8:
            temp = [
                Message(content: "Maybe 1992?", position: false)
            ]
            break
        case 9:
            temp = [
                Message(content: "1990 I think.", position: false)
            ]
            break
        case 10:
            temp = [
                Message(content: "1988. I know it was her 33-year-old birthday a few days ago.", position: false)
            ]
            break
        case 11:
            temp = [
                Message(content: "That's great! Thank you Chris. I will keep gathering clues to find Jerry back!", position: false)
            ]
            break
        default:
            temp = [
                Message(content: "Closing connection...", position: false),
            ]
        }
    }
    else {
        switch currentState {
        case 0:
            temp = [
                Message(content: "Hi, this is Chris from the Tech Department!"),
                Message(content: "Forgot your passcode, Jerry? Let me help you."),
                Message(content: "Wait...I need to verify your identity first. Well, you know the protocols."),
                Message(content: "Please answer your security question: \"What is your favorite TV series?\""),
            ]
            break
        case 1: // Honest response from 0
            temp = [
                Message(content: "What the... Oh god that's not good..."),
                Message(content: "Oh, me and Jerry work together, and he's... Umm, sort of investigator, you know... Anyway, how can I help??"),
            ]
            break
        case 2: // Confused response from 0
            temp = [
                Message(content: "That’s not the right answer. Please try again."),
            ]
            break
        case 3:
            temp = [
                Message(content: "Unfortunately, the validation is failed. Are you really Jerry?"),
            ]
            break
        case 4:
            temp = [
                Message(content: "I would like to help, but due to our security mechanism, I am not able to unlock this phone remotely unless you answer at least ONE verification question like the previous one."),
                Message(content: "Would you like to try another question?"),
            ]
            break
        case 5:
            temp = [
                Message(content: "Only if I can. You have to answer the verification question first. This is the security mechanism, no one breaks it."),
            ]
            break
        case 6:
            temp = [
                Message(content: "yeah…"),
                Message(content: "In what year was Judy born?"),
            ]
            break
        case 7:
            temp = [
                Message(content: "In what year was Judy born?"),
            ]
            break
        case 8:
            temp = [
                Message(content: "Hmm, not right."),
            ]
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["I think Judy's birthday was mentioned somewhere?", "Check the background story"], solution: "1988")
            break
        case 9:
            temp = [
                Message(content: "That is not correct."),
            ]
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["I think Judy's birthday was mentioned somewhere?", "Check the background story"], solution: "1988")
            break
        case 10:
            temp = [
                Message(content: "This is it! Verification passed!"),
                Message(content: "I can remove the screen lock for you now."),
            ]
            break
        case 11:
            temp = [
                Message(content: "Also, I managed a way around to look into some low-level code of this phone. All the data are still encrypted, but I do have some way to help you dig the information."),
                Message(content: "Keep me updated! I really want to help."),
            ]
            break
        default:
            temp = []
        }
    }
    
    return temp
}


/// - Returns: Next state
func getChoice(currentState: Int) -> ([String], [Int]) {
    var temp = ([""],[-1])
    switch currentState {
    case 0:
        temp = (["Honest", "Skeptical"], [1, 2])
        break
    case 1:
        temp = (["Sincere", "Demand"], [4, 5])
        break
    case 2:
        temp = (["Apology", "Skeptical"], [1, 3])
        break
    case 3:
        temp = (["Truth"], [1])
        break
    case 4:
        temp = (["Affirm"], [6])
        break
    case 5:
        temp = (["Affirm"], [7])
        break
    case 6:
        temp = (["1988", "1990", "1992"], [10, 9, 8])
        break
    case 7:
        temp = (["1988", "1990", "1992"], [10, 9, 8])
        break
    case 8:
        temp = (["1988", "1990", "1992"], [10, 9, 8])
        break
    case 9:
        temp = (["1988", "1990", "1992"], [10, 9, 8])
        break
    case 10:
        temp = (["Optimistic"], [11])
        break
    case 11:
        temp = (["Done"], [12])
        break
    default:
        temp = ([],[])
    }
    return temp
}

/*
 
 1: Hello, this is Malware Tech, please identify yourself.
 
 
 
 */
