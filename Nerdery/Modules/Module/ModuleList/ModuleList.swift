//
//  ModuleList.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct ModuleList: View {
    @StateObject var viewModel: ModuleListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if !viewModel.modules.isEmpty {
                        Text("Select Module")
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    LazyVStack{
                        ForEach(viewModel.modules) { module in
                            NavigationLink(destination: ModuleDetails(viewModel: ModuleDetailViewModel(moduleTitle: module.title, moduleId: module.id))) {
                                NerderyRow(title: module.title, description: module.description) {
                                    if module.isCompleted {
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
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            }
            .showLoader(isLoading: viewModel.isLoading)
            .navigationTitle("Modules")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList(viewModel: ModuleListViewModel(userId: "userId", programId: "programId"))
    }
}
