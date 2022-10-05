//
//  WeekDetails.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct WeekDetail: View {
    @StateObject var viewModel: WeekDetailViewModel
    @State private var presentedTheme: Theme?
    
    var body: some View {
        VStack {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text(viewModel.weekTitle)
                    if viewModel.isCompleted {
                        ChipLabel(title: "Done")
                            .foregroundColor(Color(.systemGreen))
                    } else {
                        ChipLabel(title: "In Progress")
                            .foregroundColor(Color("LightOrange"))
                    }
                }
                Picker("Detail", selection: $viewModel.displayedDetail) {
                    ForEach(WeekDetailType.allCases, id: \.self) {
                        Text($0.title)
                            .tag($0)
                    }
                    
                }.pickerStyle(.segmented)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            
            .background(Color("Ellipse1").cornerRadius(16, corners: [.bottomLeft, .bottomRight]))
            
            content
            Spacer()
        }
        .navigationTitle("Week title")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $presentedTheme) { item in
            EvaluationDetail(title: item.name, feedBacks: [.example, .example1], score: "10", mentorName: "Carlos Perez")
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.displayedDetail {
        case .themeList:
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.topics) { topic in
                        Button {
                            presentedTheme = topic
                        } label: {
                            NerderyRow(title: topic.name, showAdditionalContent: false, additionalContent: { })
                        }
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
                .showLoader(isLoading: viewModel.isLoadingTopics)
            }
        case .challenge:
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.assignments) { assigment in
                        NerderyRow(title: assigment.description, showAdditionalContent: false, isNavigation: false, additionalContent: { })
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
                .showLoader(isLoading: viewModel.isLoadingTopics)
            }
        case .evaluation:
            FeedbackList(items: viewModel.feedbacks)
        }
    }
}

struct WeekDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeekDetail(viewModel: WeekDetailViewModel(moduleId: "moduleId", weekId: "weekId", weekTitle: "Week 1", isCompleted: false))
    }
}
