//
//  Profile.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct Profile: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.user.name)
                            .font(.title)
                            .fontWeight(.medium)
                        
                        Text(viewModel.user.technology)
                    }
                    
                    Spacer()
                    
                    Image("MockUser")
                }
                .padding(.horizontal, 16)

                ProgressOverview(progress: 50, score: "10")
            }
            .padding()
            .showLoader(isLoading: viewModel.isLoading)
            .navigationTitle("The Nerdery")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(viewModel: ProfileViewModel(userId: "test"))
    }
}
