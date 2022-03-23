//
//  ContentView.swift
//  Animations
//
//  Created by Kevin Stradtman on 3/23/22.
//
//.blur(radius: (animationAmount - 1) * 3)
//.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
        )
        .scaleEffect(animationAmount)
        .animation(.easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
