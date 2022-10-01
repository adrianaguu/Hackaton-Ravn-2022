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
            
            content
            Spacer()
        }
        .navigationTitle("MODULE TITLE")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.displayedDetail {
        case .weekList:
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.weeks) { week in
                        NavigationLink(destination: WeekDetail(viewModel: WeekDetailViewModel(moduleId: viewModel.moduleId, weekId: week.id))) {
                            Text("Week Detail")
                        }
                    }
                }
                .showLoader(isLoading: viewModel.isLoadingWeeks)
            }
           
        case .evaluation:
            ScrollView {
                LazyVStack {
                    Text("Evaluation")
                }
                .showLoader(isLoading: viewModel.isLoadingFeedbacks)
            }
        }
    }
}

struct ModuleDetails_Previews: PreviewProvider {
    static var previews: some View {
        ModuleDetails(viewModel: .init(moduleId: "moduleId"))
    }
}
