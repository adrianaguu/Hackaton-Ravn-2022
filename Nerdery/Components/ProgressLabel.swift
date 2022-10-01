//
//  ProgressLabel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct ProgressLabel: View {
    var tintColor: Color
    let progress: Double
    let score: String

    var body: some View {
        ProgressView(value: progress, total: 100)
            .progressViewStyle(.linear)
            .tint(tintColor)
            .background(Color(uiColor: .systemGray))
            .scaleEffect(x: 1, y: 2, anchor: .center)
        
        HStack {
            Text("Done ") +
            Text("\(progress, specifier: "%.0f")%")
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Your Score is ") +
            Text(score)
                .fontWeight(.bold)
        }
    }
}

struct ProgressLabel_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLabel(tintColor: .accentColor, progress: 50, score: "10")
    }
}
