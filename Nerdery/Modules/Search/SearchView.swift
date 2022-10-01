//
//  SearchView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Text("Search")
                }
            }
            .navigationTitle("Search title")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
