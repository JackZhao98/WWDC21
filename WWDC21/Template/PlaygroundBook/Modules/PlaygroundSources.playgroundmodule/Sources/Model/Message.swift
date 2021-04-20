//
//  Message.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/17/21.
//

import Foundation
import SwiftUI

public struct Message: Identifiable, Equatable {
    public var id: UUID = UUID()
    public var content: String
    public var position: Bool = true // True: Left, False: Right
    public var timeBefore: String = ""
}


public struct Chat: Identifiable, Equatable {
    public var profile: Image = Image(systemName: "person.circle.fill")
    public var senderName: String
    public var conversations: [Message]
    public var id: UUID = UUID()
}

extension Chat {
    static var appData = [
        Chat(senderName: "Judy ❤️", conversations: [
            Message(content: "Hey honey, how's your business trip? Miss you so much.", position: true, timeBefore: "Apr 11, 5:57PM"),
            Message(content: "It's okay, but nothing's bettter than home 😘", position: false, timeBefore: "Apr 11, 6:02PM"),
            Message(content: "Luckily, this is the last day.", position: false),
            Message(content: "That's right, I'll see you tomorrow! Take care of yourself!", position: true),
            Message(content: "I will!", position: false),
            Message(content: "Happy birthday Judy! Love U!", position: false, timeBefore: "Apr 12, 9:01AM"),
            Message(content: "Awwwww thanks Jerry!", position: true),
            Message(content: "Did you get my present yet?", position: false),
            Message(content: "Yesss! Got the package this morning.", position: true),
            Message(content: "How'd you know I wanted this album so deadly? Thank you!!!", position: true),
            Message(content: "Hahaha you put it on repeat every morning, of course I know LOL", position: false),
            Message(content: "You know me 😄", position: true),
            Message(content: "Don't be late for tonight's party at 6! Got your favorite brisket.", position: true),
            Message(content: "No problem, see you then!", position: false),
            Message(content: "Jerry, are you almost home? The friends are coming.", position: true, timeBefore: "Apr 12, 5:38PM"),
            Message(content: "Come on honey, we are waiting for you.", position: true, timeBefore: "Apr 12, 6:10PM"),
            Message(content: "We'll start eating then. Just come back soon.", position: true, timeBefore: "Apr 12, 6:17PM"),
            Message(content: "Where are you Jerry? Pick up the phone! I'm worried...", position: true, timeBefore: "Apr 12, 7:24PM"),
            Message(content: "Jerry?", position: true, timeBefore: "Apr 12, 7:57PM"),
            Message(content: "Jerry are you Ok??? Call me back pls.", position: true, timeBefore: "Apr 12, 8:40PM"),
            Message(content: "Just...call me. I'm so worried.", position: true, timeBefore: "Apr 12, 10:25PM"),
        ]),
        Chat(senderName: "Jimmy Woo", conversations: [
            Message(content: "We've got a new case.", position: true, timeBefore: "Apr 10, 9:42AM"),
            Message(content: "Site 087. Do you know this place?", position: true),
            Message(content: "Of course, what's going on?", position: false),
            Message(content: "We have six agents gone MIA at Site 087 an hour ago.", position: true),
            Message(content: "What?? Isn't that place secured since two years ago? And all investigators are required to stay 100 meters away from its perimeter to ensure safety, I suppose. Did they go too close?", position: false),
            Message(content: "Negative. We detected enormous amount of radioactive matters near the Site 087, I think the affected area is growing larger.", position: true),
            Message(content: "Understood. I'm going to the site immediately. Need to find out why.", position: false),
            Message(content: "DO NOT GO ALONE.", position: true, timeBefore: "Apr 10, 9:50AM"),
            Message(content: "The cause of the anomaly is still unknown. It's too dangerous.", position: true),
            Message(content: "Jerry, do you copy?", position: true),
            Message(content: "Don't worry. Don't forget it was me solved the Site 087 case two years ago.", position: false, timeBefore: "Apr 08, 10:38AM"),
            Message(content: "If something's wrong with this site, it could only be me to fix it again.", position: false),
            Message(content: "Fine. Just be extremely careful alright? And keep in touch.", position: true, timeBefore: "Apr 10, 11:00AM"),
            Message(content: "By the way, I've emailed you more details about the case.", position: true),
            Message(content: "Ok boss.", position: false),
            Message(content: "Got anything yet?", position: true, timeBefore: "Apr 11, 4:27PM"),
            Message(content: "I investigated the surrounding areas, nothing yet. I'm going closer to Site 087 tomorrow.", position: false),
            Message(content: "That's too dangerous. The reinforcement is arriving tomorrow. Wait for them before approaching.", position: true),
            Message(content: "I can't wait that long. Gotta go to my wife's birthday at night. Don't worry, I' be alright.", position: false),
            Message(content: "Nothing can stop you huh. Stay alert!", position: true),
            Message(content: "I will.", position: false),
            Message(content: "Jerry, report please.", position: true, timeBefore: "Apr 12, 12:03PM"),
            Message(content: "Jerry?", position: true, timeBefore: "Apr 12, 12:27PM"),
        ]),
        Chat(senderName: "Jack", conversations: [
            Message(content: "How's it going Jerry!", position: true, timeBefore: "Apr 10, 3:33PM"),
            Message(content: "So far so good. I'm on a business trip now.", position: false),
            Message(content: "Sounds busy. When you are gonna return?", position: true, timeBefore: "Apr 10, 3:40PM"),
            Message(content: "Yeah it's really tiring. I'll come back on the 12th.", position: false, timeBefore: "Apr 10, 3:55PM"),
            Message(content: "Great! Wait a minuute, 12th, isn't that Judy's birthday? I was invited to her party.", position: true),
            Message(content: "Oh really XD I'll see you then pal!", position: false),
            Message(content: "By the way, how's your contest going?", position: false, timeBefore: "Apr 10, 4:16PM"),
            Message(content: "The coding challenge you mentioned.", position: false),
            Message(content: "It's been running smooth.", position: true),
            Message(content: "The deadline is near, and I'm doing some last-minute polishing.", position: true),
            Message(content: "Good luck!", position: false),
            Message(content: "Thanks Jerry.", position: true),
            Message(content: "Jerry where are you? I'm at your place, not seeing you around.", position: true, timeBefore: "Apr 12, 6:03PM"),
            Message(content: "Oh my god where have you been?? Just give us a call...", position: true, timeBefore: "Apr 12, 7:05PM"),
        ]),

        Chat(senderName: "Unknown Sender", conversations: [
            Message(content: "You order 037264827482 has been picked up, it will arrive today at 8:00 AM - 10:00 AM.", position: true, timeBefore: "Apr 12, 6:47AM"),
            Message(content: "You order 037264827482 has been delivered. If you have any questions regarding the order, please contact customerservice@deliver.com. Thanks for choosing the Deliver™ service.", position: true, timeBefore: "Apr 12, 8:35AM"),
        ]),
    ]
}
