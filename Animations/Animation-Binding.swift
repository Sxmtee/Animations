//
//  Animation-Binding.swift
//  Animations
//
//  Created by mac on 06/06/2024.
//

import SwiftUI


struct AnimationBinding: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper(
                "Scale Amount",
                value: $animationAmount.animation(
                    .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
                ),
                in: 1...10
            )
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(20)
            .background(.purple)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),
                value: animationAmount
            )
        }
        .padding(20)
    }
}

#Preview {
    AnimationBinding()
}
