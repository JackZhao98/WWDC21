//
//  AppIconView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI

struct AppIconView: View {
    var icon: Image
    var iconColor: Color
    var iconBackground: Color
    var appName: String
    var disabled: Bool
    var appAction: () -> ()
    
    private let cornerRadius: CGFloat = 20
    private let iconSize: CGFloat = 80
    
    var body: some View {
        Button(action: {
            withAnimation {
                appAction()
            }
        }) {
            VStack {
                ZStack {
                    self.iconBackground
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 0.6 * iconSize, height: 0.6 * iconSize)
                        .foregroundColor(self.iconColor)
                }
                .frame(width: iconSize, height: iconSize, alignment: .center)
                .background(iconBackground)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                
                Text("\(self.appName)")
                    .frame(maxWidth: 0.9 * iconSize)
                    .minimumScaleFactor(0.5)
                    .font(.system(size: 20))
                    .lineLimit(1)
            }
        }
    }
}

//
//struct AppIconView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppIconView(icon: <#Image#>, iconColor: <#Color#>, iconBackground: <#Color#>, appName: <#String#>, disabled: <#Bool#>, appAction: <#() -> ()#>)
//    }
//}
