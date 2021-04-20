//
//  AppGroupView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI
import PlaygroundSupport

struct AppGroupView: View {
    @Binding var currentApp: App
    let fontColor: Color
    @Binding var progress: Int
    
    var threeRowGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private let cornerRadius: CGFloat = 25
    var body: some View {
        LazyVGrid (columns: threeRowGrid, alignment: .center, spacing: 30) {
            AppIconView(icon: Image(systemName: "message.fill"), iconColor: Color.white, iconBackground: Color.green, appName: "Message", disabled: true, appAction: {
                currentApp = .MESSAGE
                if progress == 1 {
                    progress = 2
                }
            })
            
            
            AppIconView(icon: Image(systemName: "envelope"), iconColor: Color.white, iconBackground: Color.blue, appName: "Email", disabled: true, appAction: {
                currentApp = .EMAIL
                if progress == 3 {
                    progress = 4
                }
            })
            
            AppIconView(icon: Image(systemName: "magnifyingglass.circle"), iconColor: Color.black, iconBackground: Color.white, appName: "Archive", disabled: true, appAction: {
                currentApp = .SEARCH
                if progress == 5 {
                    progress = 6
                }
            })
        }
        .foregroundColor(self.fontColor)
        .padding(.horizontal, 5)
        .padding(.top, 20)
    }
}
