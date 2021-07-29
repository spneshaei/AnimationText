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
                    .animatableFont(size: firstFontSize)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                HStack(spacing: 0) {
                    ForEach(0 ..< "CodeStar".count, id: \.self) { index in
                        Text(String("CodeStar"["CodeStar".index("CodeStar".startIndex, offsetBy: index)]))
                            .animatableFont(size: firstFontSize)
                            .foregroundColor(Color.white)
                            .colorMultiply(randomColor)
                    }
                }
            }
            ZStack {
                Text("Summer 1400")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                HStack(spacing: 0) {
                    ForEach(0 ..< "Summer 1400".count, id: \.self) { index in
                        Text(String("Summer 1400"["Summer 1400".index("Summer 1400".startIndex, offsetBy: index)]))
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(Color.white)
                            .colorMultiply(randomColor)
                    }
                }
            }
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

extension View {
    func animatableFont(size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(size: size))
    }
}
