//
//  ProgressOverview.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct ProgressOverview: View {
    let progress: Double
    let score: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Progress Overview")
                .fontWeight(.bold)
            
            ProgressView(value: progress, total: 100)
                .progressViewStyle(.linear)
                .tint(.white)
                .foregroundColor(Color.grayDark02)
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
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color.ellipse1)
        )
    }
}

struct ProgressOverview_Previews: PreviewProvider {
    static var previews: some View {
        ProgressOverview(progress: 50, score: "10")
    }
}
