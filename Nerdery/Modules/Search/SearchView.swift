//
//  SearchView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                FeedbackList(items: viewModel.searchResults)
                    .showLoader(isLoading: viewModel.isLoading)
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search title")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init(userId: "1"))
    }
}
