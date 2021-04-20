//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import BookCore
import PlaygroundSources
import PlaygroundSupport
import SwiftUI

var locked = true
var emergency = false

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(MainView(locked: locked, viewEmergency: emergency))

struct MainView: View {
    @State var locked: Bool
    @State var viewEmergency: Bool
    
    var body: some View {
        ZStack {
            HomeView()
            if (locked) {
                BlurBackgroundView(style: .systemUltraThinMaterialDark)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Image(systemName: "lock.shield.fill")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .center)
                        .foregroundColor(.white)
                        .padding(25)
                        .padding(.bottom)
                    
                    Text("This device is locked, please contact emergency service.")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.8)
                        .lineLimit(2)
                        .frame(maxWidth: 350)
                        .padding(.bottom, 30)
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        viewEmergency.toggle()
                    }) {
                        ZStack {
                            Text("Emergency Service")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                                .frame(width: 260, height: 50)
                                .background(BlurBackgroundView(style: .systemUltraThinMaterial)
                                                .clipShape(Capsule()))
                            
                        }
                    }
                    .padding(.bottom, 25)
                }
                .sheet(isPresented: self.$viewEmergency, content: {
                    EmergencyChatView()
                        .frame(maxWidth: .infinity)
                })
            }
        }
    }
}


