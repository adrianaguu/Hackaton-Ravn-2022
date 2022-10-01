//
//  CheckDialogRectangle.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct CheckDialogRectangle: View {
    enum Sizes {
        static let width = 140.0
        static let height = 40.0
        static let cornerRadius = 24.0
        
        enum Dialog {
            static let spacing = 8.0
            static let checkPadding = 8.0
            static let checkWidth = 12.0
            static let checkHeight = 8.0
            static let firstWidht = 40.0
            static let secondWidth = 20.0
        }
    }

    var body: some View {
        RoundedRectangle(cornerRadius: Sizes.cornerRadius)
            .fill(Color.background02)
            .frame(width: Sizes.width, height: Sizes.height)
            .overlay {
                HStack(spacing: Sizes.Dialog.spacing) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: Sizes.Dialog.checkWidth, height: Sizes.Dialog.checkHeight)
                        .gradiantCircularBackground(gradient: .gradient01, startPoint: .topLeading, endPoint: .bottomTrailing)
                        .padding(Sizes.Dialog.checkPadding)
                    
                    VStack(alignment: .leading) {
                        dialog(width: Sizes.Dialog.firstWidht)
                        
                        dialog(width: Sizes.Dialog.secondWidth)
                    }
                    
                    Spacer()
                }
            }
    }
    
    func dialog(width: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.deactive)
            .frame(width: width, height: 4)
    }
}

struct CheckDialogRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CheckDialogRectangle()
    }
}
