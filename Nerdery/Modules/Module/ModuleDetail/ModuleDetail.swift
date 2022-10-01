//
//  ModuleDetails.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct ModuleDetails: View {
    @StateObject var viewModel: ModuleDetailViewModel

    var body: some View {
        VStack {
            Picker("Detail", selection: $viewModel.displayedDetail) {
                ForEach(ModuleDetailType.allCases, id: \.self) {
                    Text($0.title)
                        .tag($0)
                }
                
            }.pickerStyle(.segmented)
                .padding(.horizontal, 16)
            
            content
            Spacer()
        }
        .navigationTitle(viewModel.moduleTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.displayedDetail {
        case .weekList:
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    if !viewModel.weeks.isEmpty {
                        Text("Select Week")
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    ForEach(viewModel.weeks) { week in
                        NavigationLink(destination: WeekDetail(viewModel: WeekDetailViewModel(moduleId: viewModel.moduleId, weekId: week.id, weekTitle: week.name, isCompleted: week.isCompleted))) {
                            NerderyRow(title: week.name) {
                                if week.isCompleted {
                                    ChipLabel(title: "Done")
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    ChipLabel(title: "In Progress")
                                        .foregroundColor(Color("LightOrange"))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            }
            .showLoader(isLoading: viewModel.isLoadingWeeks)
            
        case .evaluation:
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.feedbacks) { feedback in
                        NerderyRow(title: feedback.content) {
                            ChipLabel(title: feedback.type)
                                .foregroundColor(Color(feedback.type == "Good" ? .systemGreen : .systemRed))
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .showLoader(isLoading: viewModel.isLoadingFeedbacks)
            }
        }
    }
}

struct ModuleDetails_Previews: PreviewProvider {
    static var previews: some View {
        ModuleDetails(viewModel: .init(moduleTitle: "Module 1", moduleId: "moduleId"))
    }
}
