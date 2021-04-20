//
//  MessageBubble.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI

struct MessageBubble: Shape {
    var leftPositionMessage: Bool
    let cornerRadius: CGSize = CGSize(width: 20, height: 20)
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [leftPositionMessage ? .bottomRight:.bottomLeft, .topLeft, .topRight], cornerRadii: cornerRadius)
        return Path(path.cgPath)
    }
}
