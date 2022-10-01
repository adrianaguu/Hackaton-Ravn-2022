//
//  FeedbackList.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct FeedbackList: View {
    let items: [Feedback]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(items) { feedback in
                    NerderyRow(title: feedback.content, isNavigation: false) {
                        ChipLabel(title: feedback.type)
                            .foregroundColor(Color(feedback.type == "Good" ? .systemGreen : .systemRed))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
    }
}

struct FeedbackList_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackList(items: [])
    }
}
