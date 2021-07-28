//
//  ContentView.swift
//  Shared
//
//  Created by Seyyed Parsa Neshaei on 7/28/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var startedAnimation = false
    @State private var finishedAnimation = false
    @State private var confettiStarted = false
    @State private var shimmerAnimation = false
    @State private var shouldBeFullScreen = false
    
    var body: some View {
        ZStack {
            if confettiStarted {
                ConfettiView(confetti: [.text("🎉"), .text("🎉"), .text("🥳"), .text("☀️")])
            }
            
            EmptyView()
                .frame(width: 800, height: 800)
                .cornerRadius(5)
            
            ShimmeringText(shimmerAnimation: shimmerAnimation, confettiStarted: confettiStarted)
                .padding()
                .rotation3DEffect(.degrees(finishedAnimation ? 0 : 20), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 2.25, x: 0, y: 15)
                .frame(height: startedAnimation ? 750 : 0)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in DispatchQueue.main.async {
                        withAnimation { shimmerAnimation.toggle() }
                    } }
                    
                    startedAnimation.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation { finishedAnimation.toggle() }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                confettiStarted.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    shouldBeFullScreen = true
                                }
                            }
                        }
                    }
                }
                .animation(.linear(duration: finishedAnimation ? 0.75 : 3))
                
            
            if confettiStarted {
                WelcomeView()
                    .shimmer(isActive: true, speed: 0.2, angle: .degrees(70))
            }
        
        }
        .background(shouldBeFullScreen ? AnyView(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea().edgesIgnoringSafeArea(.all)) : AnyView(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea().edgesIgnoringSafeArea(.all).cornerRadius(20)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChatBubbleView: View {
    var body: some View {
        HStack {
            Spacer()
            ChatBubble(direction: .left) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
            }
            .offset(x: 500, y: -200)
            Spacer()
        }
    }
}

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to CodeStar!")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 60))
                .padding()
                .cornerRadius(5)
        }
        .padding()
    }
}
