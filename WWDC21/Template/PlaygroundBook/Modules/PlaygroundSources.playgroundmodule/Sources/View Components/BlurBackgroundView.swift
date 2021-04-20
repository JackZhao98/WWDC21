//
//  BlurBackgroundView.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/3/21.
//

import SwiftUI

public struct BlurBackgroundView: UIViewRepresentable {
    public typealias UIViewType = UIView
    
    public var style: UIBlurEffect.Style
    
    public init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    public func makeUIView(context: UIViewRepresentableContext<BlurBackgroundView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }

    public func updateUIView(_ uiView: UIView, context:
                        UIViewRepresentableContext<BlurBackgroundView>) {
        
    }
}
