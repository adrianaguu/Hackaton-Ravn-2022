//
//  ModuleDetails.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct ModuleDetails: View {
    @StateObject var viewModel = ModuleDetailViewModel()

    var body: some View {
        VStack {
            Picker("Detail", selection: $viewModel.displayedDetail) {
                ForEach(ModuleDetailType.allCases, id: \.self) {
                    Text($0.title)
                        .tag($0)
                }
                
            }.pickerStyle(.segmented)
            
            content
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.displayedDetail {
        case .weekList:
            NavigationLink(destination: WeekDetail()) {
                Text("Week Detail")
            }
        case .evaluation:
            Text("Evaluation")
        }
    }
}

struct ModuleDetails_Previews: PreviewProvider {
    static var previews: some View {
        ModuleDetails(viewModel: .init())
    }
}
