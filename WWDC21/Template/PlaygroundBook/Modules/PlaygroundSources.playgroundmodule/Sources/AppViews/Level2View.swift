//
//  Level2.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI
import PlaygroundSupport

public struct LevelTwoView: View {
    @State var locked: Bool = true
    
    @State var a: Int? = nil
    @State var b: Int? = nil
    @State var c: Int? = nil
    @State var d: Int? = nil
    @State var incorrectTimes = 0
    
    let allowed = 3
    private let password: Int = 0607
    
    public init () {
        
    }
    
    public var body: some View {
        ZStack {
            HomeView()
                .disabled(true)
                .blur(radius: 5)
            BlurBackgroundView(style: .systemUltraThinMaterialDark)
                .overlay(Text("Unlocked")
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.gray)
                            .offset(y: -20))
            if (locked) {
                BlurBackgroundView(style: .systemMaterial)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack (spacing: 20){
                    HStack (spacing: 15) {
                        Spacer()
                        Image(systemName: a != nil ? "circle.fill" : "circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: b != nil ? "circle.fill" : "circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: c != nil ? "circle.fill" : "circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: d != nil ? "circle.fill" : "circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Spacer()
                    }
                    Text(incorrectTimes == 0 ? "Enter Passcode" : incorrectTimes >= allowed ? "Check hint below" : "Remaining attempts\nbefore the hint: \(allowed - incorrectTimes)")
                        .font(.system(size: 24, design: .rounded))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.8)
                        .lineLimit(2)
                        .padding(.bottom, 30)
                    LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 20, content: {
                        ForEach(1..<10, id: \.self) { n in
                            Button(action: {
                                fillNum(num: n)
                            }) {
                                ZStack {
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(Color.black.opacity(0.2))
                                    Text("\(n)")
                                        .font(.system(size: 36))
                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.black.opacity(0.001))
                        Button(action: {
                            fillNum(num: 0)
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color.black.opacity(0.2))
                                Text("0")
                                    .font(.system(size: 36))
                                    .foregroundColor(.black)
                            }
                        }
                        if a != nil {
                            Button(action: deleteNum) {
                                ZStack {
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(Color.black.opacity(0.2))
                                    Image(systemName: "multiply")
                                        .font(.system(size: 26))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    })
                }
            }
        }
    }
    
    func fillNum(num: Int) {
        if a == nil {
            a = num
        } else if b == nil {
            b = num
        } else if c == nil {
            c = num
        } else {
            d = num
            
            // Check here
            if check() {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Password correct! Move on to next page.")
                self.locked = false
            } else {
                incorrectTimes += 1
                a = nil
                b = nil
                c = nil
                d = nil
                
                if incorrectTimes >= allowed {
                    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Look at the code from the bottom, seems like we need to make the value of \"x\" larger than 0 and smaller than 10", "\"x\" only meats that range if it is first added by 10 then subtracted by 3", "\"a\" and \"c\" must be the same, and \"a\" seems to be 0", "The difference between \"d\" and \"b\" is 1"], solution: "0\(password)")
                }
            }
        }
    }
    
    func deleteNum() {
        if d != nil {
            d = nil
        } else if c != nil {
            c = nil
        } else if b != nil {
            b = nil
        } else if a != nil {
            a = nil
        } else {}
    }
    
    func check() -> Bool {
        return a! * 1000 + b! * 100 + c! * 10 + d! == password
    }
}
