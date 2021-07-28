//
//  ShimmeringText.swift
//  AnimationText
//
//  Created by Seyyed Parsa Neshaei on 7/28/21.
//

import SwiftUI

struct ShimmeringText: View {
    @State var shimmerAnimation: Bool
    @State var confettiStarted: Bool
    
    var body: some View {
        let firstFontSize = CGFloat.random(in: 123...148)
        
        return VStack(spacing: 15) {
            ZStack {
                Text("CodeStar")
//                    .font(.system(size: 125, weight: .bold))
                    .animatableFont(size: firstFontSize)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                HStack(spacing: 0) {
                    ForEach(0 ..< "CodeStar".count, id: \.self) { index in
                        Text(String("CodeStar"["CodeStar".index("CodeStar".startIndex, offsetBy: index)]))
//                            .font(.system(size: 105, weight: .bold))
                            .animatableFont(size: firstFontSize)
                            .foregroundColor(Color.white)
                            .colorMultiply(randomColor)
                    }
                }
//                .mask(
//                Rectangle()
//                    .fill(
//                        LinearGradient(gradient: .init(colors: [.white.opacity(0.5), .white, .white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
//                    )
//                    .rotationEffect(.init(degrees: 70))
//                    .padding(20)
//                    .offset(x: -250)
//                    .offset(x: shimmerAnimation ? 500 : 0)
//                )
            }
            ZStack {
                Text("Summer 1400")
                    .font(.system(size: 80, weight: .bold))
//                    .animatableFont(size: secoondFontSize)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                HStack(spacing: 0) {
                    ForEach(0 ..< "Summer 1400".count, id: \.self) { index in
                        Text(String("Summer 1400"["Summer 1400".index("Summer 1400".startIndex, offsetBy: index)]))
                            .font(.system(size: 80, weight: .bold))
//                            .animatableFont(size: secoondFontSize)
                            .foregroundColor(Color.white)
                            .colorMultiply(randomColor)
                    }
                }
            }
        }
        .onAppear {
//            withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
////                if hasMainAnimationFinished {
////                    print("again")
//                animation.toggle()
////                }
//            }
        }
    }
    
    var randomColor: Color {
        if confettiStarted {
            return .black
        }
        return Color(UIColor(red: .random(in: 0.8...1), green: .random(in: 0.5...1), blue: .random(in: 0...1), alpha: 1))
    }
}

struct ShimmeringText_Previews: PreviewProvider {
    static var previews: some View {
        ShimmeringText(shimmerAnimation: true, confettiStarted: true)
    }
}

struct AnimatableCustomFontModifier: AnimatableModifier {
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold))
    }
}

// To make that easier to use, I recommend wrapping
// it in a `View` extension, like this:
extension View {
    func animatableFont(size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(size: size))
    }
}
