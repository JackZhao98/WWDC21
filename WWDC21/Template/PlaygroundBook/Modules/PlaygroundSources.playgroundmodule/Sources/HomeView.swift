//
//  HomeView.swift
//  PlaygroundBook
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI
import PlaygroundSupport

public enum App {
    case HOME
    case MESSAGE
    case EMAIL
    case SEARCH
}

public struct HomeView: View {
    @State var progress: Int = 1
    @State var currentApp: App = .HOME
    @State var showTracker = false
    let fontColor: Color = .white
    let backgroundColor: Color = .black
    public init () {
        
    }
    public var body: some View {
        VStack (spacing: 0) {
            VStack {
                StatusBarView()
                switch currentApp {
                case .HOME:
                    VStack {
                        TaskTrackerView(progress: progress)
                        AppGroupView(currentApp: self.$currentApp, fontColor: fontColor, progress: self.$progress)
                        Spacer()
                    }
                case .MESSAGE:
                    ZStack {
                        MessageView(currentApp: self.$currentApp, progress: self.$progress)
                            .blur(radius: self.showTracker ? 3.0 : 0)
                            .onTapGesture {
                                self.showTracker = false
                            }
                        HintButton(showTracker: self.$showTracker, progress: self.$progress)
                    }
                case .EMAIL:
                    ZStack {
                        EmailView(currentApp: self.$currentApp, progress: self.$progress)
                            .blur(radius: self.showTracker ? 3.0 : 0)
                            .disabled(self.showTracker)
                            .onTapGesture {
                                self.showTracker = false
                            }
                        HintButton(showTracker: self.$showTracker, progress: self.$progress)
                    }
                case .SEARCH:
 
                    ZStack {
                        VStack {
                            HStack {
                                Button (action: {
                                    currentApp = .HOME
                                }) {
                                    Label("Home", systemImage: "chevron.backward")
                                        .font(.title3)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            SearchView()
                        }
                        .blur(radius: self.showTracker ? 3.0 : 0)
                        .onTapGesture {
                            self.showTracker = false
                        }
                        
                        HintButton(showTracker: self.$showTracker, progress: self.$progress)
                    }
                }
            }
        }
        .background(backgroundColor)
    }
}

struct HintButton: View {
    @Binding var showTracker: Bool
    @Binding var progress: Int
    var body: some View {
        VStack {
            Spacer()
            if showTracker {
                TaskTrackerView(progress: progress)
            }
            HStack {
                Spacer()
                Button(action: {
                    showTracker.toggle()
                }, label: {
                    ZStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                    }
                })
                .frame(width: 40, height: 40, alignment: .center)
                .padding(40)
            }
        }
    }
}
