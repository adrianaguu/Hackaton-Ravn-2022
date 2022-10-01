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
                    NavigationLink(destination: ModuleDetails()) {
                        Text("Module")
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
