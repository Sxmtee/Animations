//
//  Explicit-Animation.swift
//  Animations
//
//  Created by mac on 06/06/2024.
//

import SwiftUI

struct ExplicitAnimation: View {
//    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        
        
//        Button("Tap Me") {
//            withAnimation(.spring(duration: 1, bounce: 0.5)) {
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(
//            .degrees(animationAmount),
//            axis: (x: 1, y: 1, z: 1)
//        )
    }
}

#Preview {
    ExplicitAnimation()
}
