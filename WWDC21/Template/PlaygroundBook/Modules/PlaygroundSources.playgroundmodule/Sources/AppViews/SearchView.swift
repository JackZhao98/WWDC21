//
//  SearchView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/17/21.
//

import SwiftUI
import Combine
import PlaygroundSupport

struct ResultView: View {
    let showResult: Bool
    @Binding var showView: Bool
    
    var body: some View {
        ZStack {
            BlurBackgroundView(style: .systemUltraThinMaterialDark)
            VStack {
                Spacer()
                if !showResult {
                    VStack {
                        Text("Access Denied.")
                            .font(.system(size: 30, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(0.5)
                        Text("You have entered the wrong information or you do not have the security clearance to access.")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 17, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .frame(maxWidth: 330)
                            .padding(.vertical)
                    }
                }
                else {
                    VStack  {
                        Text("Site 087 (CLASSIFIED)")
                            .font(.system(size: 25, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .padding(.top, 25)
                            .padding(.bottom)
                        VStack (alignment: .leading, spacing: 7) {
                            HStack {
                                Text("Object Type: ")
                                    .font(.system(size: 16, design: .rounded))
                                    .foregroundColor(.white)
                                    .bold()
                                Text("Site")
                                    .font(.system(size: 16, design: .rounded))
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                            }
                            VStack (alignment: .leading) {
                                Text("Object Description: ")
                                    .font(.system(size: 16, design: .rounded))
                                    .foregroundColor(.white)
                                    .bold()
                                Text("Site 087 is known to be an anomalous phenomenon happens in 36.5323° N, 116.9325° W. The affected area is about 1.2 squared kilo-meters. Strong magnetic field detected near the Site 087, all electronic devices near the Site 087 are malfunctioning.")
                                    .font(.system(size: 16, design: .rounded))
                                    
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                            }
                            VStack (alignment: .leading) {
                                Text("Recent Discovery:")
                                    .font(.system(size: 16, design: .rounded))
                                    .foregroundColor(.white)
                                    .bold()
                                Text("The Electromagnetic level near Site 087 is stable at most time, but extremely sensitive to the millimeter wavelength. Small amount of mmWave radiation would cause enormous EM reading rising. Living creatures all disappeared after entering Site 087 when the EM field is active.")
                                    .font(.system(size: 16, design: .rounded))
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .frame(width: 360)
                    }
                    .onAppear {
                        PlaygroundPage.current.assessmentStatus = .pass(message: "The Site 087 is sensitive to the millimeter wavelength, and recent phones are equipped with mmWave... No wonder he left his phone behind. Anyway, it's time to move on to Site 087 to find Jerry, must be careful... --- Thanks for playing :)")
                    }
                }
                Spacer()
                Button(action: {
                    showView.toggle()
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color.white.opacity(0.1))
                        Text("Cancel")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.callout)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 130, height: 50)
                .padding(.bottom, 50)
                
            }
        }
    }
}


struct SearchView: View {
    @State var selectedCode: String = ""
    @State var ID: String = ""
    
    @State var showResultView: Bool = false
    @State var showHelp: Bool = false
    let code: String = "ST"
    let correctID: String = "706087"
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 90, weight: .light))
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .padding()
                    Text("Digital Archive")
                        .font(.system(size: 30, design: .rounded))
                        .foregroundColor(.white)
                        .opacity(0.7)
                    
                    HStack {
                        TextField("CA", text: $selectedCode)
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width*0.1, height: 30)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .onReceive(Just(selectedCode), perform: { _ in
                                limitCodeInput()
                            })
                        
                        Text("–")
                            .font(.system(size: 30, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(0.5)
                        
                        TextField("123456", text: $ID)
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width*0.25, height: 30)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .onReceive(Just(ID), perform: { _ in
                                limitIDInput()
                            })
                        
                        
                        Button(action: {
                            self.showHelp.toggle()
                        }) {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                        }
                        .frame(width: 30, height: 30)
                    }
                    .padding()
                    
                    Text("Enter the category code followed by the 6-digit identifier. E.x. CA-123456.\nFor the category code, tap the help button for more information.")
                        .font(.system(size: 18, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                        .frame(maxWidth: 300)
                    
                    Spacer()
                    Button(action: {
                        showResultView.toggle()
                    }) {
                        ZStack {
                            Capsule()
                                .foregroundColor(Color.white.opacity(0.1))
                            Text("Search")
                                .foregroundColor(Color.white.opacity(0.7))
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: geo.size.width*0.3, height: 50)
                    .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .sheet(isPresented: $showHelp, content: {
                    VStack {
                        Text("Category Code Table")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.top, 100)
                        HStack {
                            VStack (alignment: .trailing) {
                                Text("Artifact: ")
                                    .font(.system(size: 18))
                                Text("Archived: ")
                                    .font(.system(size: 18))
                                Text("Building: ")
                                    .font(.system(size: 18))
                                Text("Creature: ")
                                    .font(.system(size: 18))
                                Text("Case: ")
                                    .font(.system(size: 18))
                                Text("Extraterrestrial: ")
                                    .font(.system(size: 18))
                                Text("Object: ")
                                    .font(.system(size: 18))
                                Text("Project: ")
                                    .font(.system(size: 18))
                                Text("Site: ")
                                    .font(.system(size: 18))
                                Text("Weapon: ")
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(.gray)
                            .frame(width: 130)
                            
                            VStack (alignment: .leading) {
                                Text("AF")
                                    .font(.system(size: 18))
                                Text("AC")
                                    .font(.system(size: 18))
                                Text("BD")
                                    .font(.system(size: 18))
                                Text("CR")
                                    .font(.system(size: 18))
                                Text("CA")
                                    .font(.system(size: 18))
                                Text("ET")
                                    .font(.system(size: 18))
                                Text("OB")
                                    .font(.system(size: 18))
                                Text("PR")
                                    .font(.system(size: 18))
                                Text("ST")
                                    .font(.system(size: 18))
                                Text("WP")
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(.gray)
                            .frame(width: 100)
                        }
                        Spacer()
                        Button(action: {
                            self.showHelp.toggle()
                        }) {
                            ZStack {
                                Capsule()
                                    .foregroundColor(Color.white.opacity(0.1))
                                Text("Cancel")
                                    .foregroundColor(Color.white.opacity(0.7))
                                    .font(.callout)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 100, height: 50)
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                })
                
                if showResultView {
                    ResultView(showResult: validate(), showView: self.$showResultView)
                }
            }
            
        }
    }
    
    func validate() -> Bool {
        return selectedCode == code && ID == correctID
    }
    
    func limitCodeInput() {
        if selectedCode.count > 2 {
            selectedCode = String(selectedCode.prefix(2))
        }
    }
    func limitIDInput() {
        if ID.count > 6 {
            ID = String(ID.prefix(6))
        }
    }
}

extension UIColor {
    /// UIColor alternative initializer.
    /// - Parameters:
    ///   - red: red value of RGB.
    ///   - green: green value of RGB.
    ///   - blue: blue value of RGB.
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /// UIColor alternative initializer.
    /// - Parameter rgb: a hex value of color.
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
