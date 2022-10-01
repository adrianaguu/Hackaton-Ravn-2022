//
//  WeekDetails.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import SwiftUI

struct WeekDetail: View {
    @StateObject var viewModel = WeekDetailViewModel()

    var body: some View {
        VStack {
            Picker("Detail", selection: $viewModel.displayedDetail) {
                ForEach(WeekDetailType.allCases, id: \.self) {
                    Text($0.title)
                        .tag($0)
                }
                
            }.pickerStyle(.segmented)
            
            content
            Spacer()
        }
        .navigationTitle("Week title")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.displayedDetail {
        case .themeList:
            ScrollView {
                LazyVStack {
                    NavigationLink(destination: ThemeDetail()) {
                        Text("Theme Detail")
                    }
                }
            }
        case .challenge:
            Text("Challenge")
        case .evaluation:
            Text("Evaluation")
        }
    }
}

struct WeekDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeekDetail()
    }
}
