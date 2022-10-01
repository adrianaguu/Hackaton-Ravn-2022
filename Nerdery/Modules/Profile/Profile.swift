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
        VStack(alignment: .leading) {
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
            
            ProgressOverview(progress: 50, score: "10")
            
            Text("Current Week")
                .fontWeight(.medium)
                .padding(.top, 24)
            
            NerderyRow(title: "Week 2", description: "Week topic name") {
                VStack {
                    ProgressLabel(tintColor: .grayDark02, progress: 40, score: "10")
                }
            }
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
