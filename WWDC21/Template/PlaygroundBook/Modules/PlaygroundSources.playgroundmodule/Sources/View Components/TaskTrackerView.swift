//
//  TaskTrackerView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/15/21.
//

import SwiftUI

struct TaskTrackerView: View {
    var progress: Int
    private let cornerRadius: CGFloat = 25
    private let height: CGFloat = 260
    
    var body: some View {
        ZStack {
            
            VStack (alignment: .leading) {
                ScrollView {
                    let taskList = getTaskList(progress: progress)
                    if taskList.count > 0 {
                        VStack (alignment: .leading) {
                            ForEach (0..<taskList.count - 1, id: \.self) { i in
                                Text(taskList[i])
                                    .foregroundColor(.white)
                                    .opacity(0.6)
                                Divider()
                            }
                            HStack {
                                Text(taskList[taskList.count - 1])
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
//                                    .frame(maxWidth: .infinity)
                                Spacer()
                            }
                        }
                        .padding()
                    }
                }
            }
            .frame(height: self.height)
            .background(BlurBackgroundView(style: .systemUltraThinMaterialDark))
            .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous))
            .padding()
            
        }
        .frame(height: self.height)
    }
    
    func getTaskList(progress: Int) -> ArraySlice<String> {
        let tasks = [
            "Check Jerry's recent messages, there might be some clue.",
            "Look at the conversation with Jimmy Woo",
            "Seems Jerry is onto the \"Site 087\". Check his Email now!",
            "Find the clue of \"Site 087\" from Jimmy Woo's Email.",
            "The file is damaged, we need to find the information somewhere else.",
            "From Jimmy's Email, we learned the identifier is 706087. Find out the category code."
        ]
        
        let ret = tasks.prefix(progress)
        return ret
    }
}
