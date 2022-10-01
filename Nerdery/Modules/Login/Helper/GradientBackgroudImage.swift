//
//  GradientBackgroudImage.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct GradientBackgroudImage: View {
    let image: Image
    let imageWidth: CGFloat? = nil
    let colors: [Color]

    var body: some View {
        Circle()
            .fill(
                LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
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
        GradientBackgroudImage(image: .avatar1, colors: [.lightGreen, .lightBlue, .lightPurple, .lightPink])
    }
}
