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
                LazyVStack{
                    ForEach(viewModel.modules) { module in
                        NavigationLink(destination: ModuleDetails(viewModel: ModuleDetailViewModel(moduleId: module.id))) {
                            Text(module.title)
                        }
                    }
                   
                }
                .showLoader(isLoading: viewModel.isLoading)
            }
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
