//
//  ChatBottomBarView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/7/21.
//

import SwiftUI

struct ChatBottomBarView: View {
    var sending: Bool
    @Binding var current: Int
    var buttonContext: [String]
    var buttonNextState: [Int]
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            Spacer()
            HStack (spacing: 30) {
                if sending {
                    Text("Connecting...")
                        .disabled(true)
                        .font(.title3)
                        .foregroundColor(.gray)
                } else {
                    ForEach(0..<buttonContext.count, id: \.self) { i in
                        Button(action: {
                            current = buttonNextState[i]
                        }) {
                            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .overlay(Text(buttonContext[i])
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 18))
                                            .bold())
                                .frame(maxWidth: 200, maxHeight: 45)
                        }
                    }
                }
            }
//            .padding(.top, 10)
            .frame(maxWidth: .infinity, maxHeight: 110)
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
    }
}
