//
//  Profile.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct Profile: View {
    @StateObject var viewModel: ProfileViewModel
    @EnvironmentObject var authentication: AuthenticationViewModel
    
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
            
            ProgressOverview(progress: 15, score: "10")
            
            Text("Current Week")
                .fontWeight(.medium)
                .padding(.top, 24)
            
            NerderyRow(title: viewModel.currentWeek.name, isNavigation: false) {
                HStack {
                    ChipLabel(title: "Modulo I")
                    
                    ChipLabel(title: "In Progress")
                        .foregroundColor(Color(uiColor: .systemOrange))
                }
            }
            
            Text("Lastest Feedback")
                .fontWeight(.medium)
                .padding(.top, 24)
            
            NerderyRow(title: viewModel.lastWeek.name) {
                VStack {
                    ProgressLabel(tintColor: .grayDark02, progress: 100, score: "10")
                    
                    HStack {
                        ChipLabel(title: "Modulo I")
                        
                        ChipLabel(title: "In Progress")
                            .foregroundColor(Color(uiColor: .systemGreen))
                        
                        Spacer()
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    authentication.updateValidation(success: false)
                } label: {
                    Text("Log out")
                }
                Spacer()
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
