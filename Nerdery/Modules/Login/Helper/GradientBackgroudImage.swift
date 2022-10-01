//
//  GradientBackgroudImage.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct GradientBackgroudImage: View {
    let image: Image
    var imageWidth: CGFloat? = nil
    let gradient: Gradient
    let startPoint: UnitPoint
    let endPoint: UnitPoint

    var body: some View {
        Circle()
            .fill(
                LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
            )
            .overlay {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth)
            }
            .clipShape(Circle())
    }
}

struct GradientBackgroudImage_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroudImage(
            image: .avatar1,
            gradient: .lightGreenToLightPink,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
