//
//  AvatarView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct AvatarView: View {
    let image: Image
    let imageSize: CGSize
    let checkDialogRectangleOffset: CGSize
    let gradient: Gradient
    let startPoint: UnitPoint
    let endPoint: UnitPoint

    var body: some View {
            image
                .resizable()
                .scaledToFit()
                .gradiantCircularBackground(
                    gradient: gradient,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
                .frame(width: imageSize.width, height: imageSize.height)
                .overlay {
                    CheckDialogRectangle()
                        .offset(checkDialogRectangleOffset)
                }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(
            image: .avatar1,
            imageSize: .init(width: 90, height: 120),
            checkDialogRectangleOffset: .init(width: 92, height: -32),
            gradient: .gradient01,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        AvatarView(
            image: .avatar2,
            imageSize: .init(width: 90, height: 120),
            checkDialogRectangleOffset: .init(width: 88, height: -32),
            gradient: .gradient03,
            startPoint: .leading,
            endPoint: .trailing
        )
        
        AvatarView(
            image: .avatar3,
            imageSize: .init(width: 90, height: 120),
            checkDialogRectangleOffset: .init(width: 88, height: -32),
            gradient: .init(colors: [.colorful04]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
