//
//  EvaluationDetail.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct EvaluationDetail: View {
    let title: String
    let feedBacks: [Feedback]
    let score: String
    let mentorName: String
    
    @Environment(\.dismiss) private var dismiss
    
    var goodFeedbacks: [Feedback] {
        feedBacks.filter { $0.type == "Good" }
    }
    
    var toImproveFeedbacks: [Feedback] {
        feedBacks.filter { $0.type == "To Improve" }
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Divider()

                HStack {
                    Text(title + " Evaluation")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Circle()
                            .foregroundColor(Color(uiColor: .secondarySystemBackground))
                            .overlay {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color(uiColor: .systemGray))
                            }
                            .frame(width: 50)
                    }
                }
                .padding()
                
                Divider()
                
                Group {
                    Text("Your Score is ") +
                    Text(score)
                        .bold()
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("To improve")
                        .font(.title3)
                        .bold()
                    
                    ForEach(toImproveFeedbacks) { item in
                        toImproveItem(feedback: item)
                    }
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Good")
                        .font(.title3)
                        .bold()
                    
                    ForEach(goodFeedbacks) { item in
                        goodItem(feedback: item)
                    }
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Mentors")
                        .font(.title3)
                        .bold()
                    
                    Text(mentorName)
                }
                .padding()
            }

            Spacer()
        }
    }
    
    func toImproveItem(feedback: Feedback) -> some View {
        HStack {
            Image(systemName: "circle")
            
            Text(feedback.content)
        }
    }
    
    func goodItem(feedback: Feedback) -> some View {
        HStack {
            Image(systemName: "circle.fill")
                .scaleEffect(0.4)
            
            Text(feedback.content)
        }
    }
}

struct EvaluationDetail_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationDetail(title: "Week 1", feedBacks: [.example, .example1], score: "10", mentorName: "Carlos Perez")
    }
}
