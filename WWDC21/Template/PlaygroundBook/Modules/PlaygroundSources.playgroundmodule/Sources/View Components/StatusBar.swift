//
//  StatusBar.swift
//  PlaygroundBook
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI

struct StatusBarView: View {
    @State var time: Date = Date()
    
    let fontColor: Color = Color.white
    private let height: CGFloat = 16
    
    var body: some View {
        HStack {
            Image(systemName: "wifi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: self.height)
            
            Spacer()
            Text(self.time, style: .time)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                .frame(height: self.height + 5)
            Image(systemName: "battery.100")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: self.height)
        }
        .foregroundColor(self.fontColor)
        .padding(20)
        .padding(.top)
    }
}
