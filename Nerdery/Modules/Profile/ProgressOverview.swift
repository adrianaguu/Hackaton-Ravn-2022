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
            
            ProgressLabel(tintColor: .white, progress: progress, score: score)
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
