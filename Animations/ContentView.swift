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
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        ScrollView {
            Spacer()
            Stepper("Scale Amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            Spacer()
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
            Spacer()
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.default, value: enabled)
            Spacer()
            Section {
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomLeading)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in dragAmount = .zero }
                        
                    )
                    .animation(.spring(), value: dragAmount)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
