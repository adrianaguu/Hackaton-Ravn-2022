//
//  GradiantCircularBackground.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct GradiantCircularBackground: ViewModifier {
    let gradient: Gradient
    let startPoint: UnitPoint
    let endPoint: UnitPoint

    func body(content: Content) -> some View {
        Circle()
            .fill(
                LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
            )
            .overlay {
                content
            }
            .clipShape(Circle())
    }
}

extension View {
    func gradiantCircularBackground(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        modifier(GradiantCircularBackground(gradient: gradient, startPoint: startPoint, endPoint: endPoint))
    }
}

struct GradiantCircularBackground_Previews: PreviewProvider {
    static var previews: some View {
        Image.avatar1
            .resizable()
            .scaledToFit()
            .gradiantCircularBackground(
                gradient: .gradient01,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
    }
}
