//
//  View+Extension.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    var isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isLoading ? 2 : 0)
            if isLoading {
                ProgressView()
            }
        }
    }
}

extension View {
    func showLoader(isLoading: Bool) -> some View {
        self.modifier(LoadingViewModifier(isLoading: isLoading))
    }
}
