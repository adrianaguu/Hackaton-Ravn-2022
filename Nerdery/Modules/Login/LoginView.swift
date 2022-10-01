//
//  LoginView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authentication: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 32) {
                avatar1
                    .offset(x: 24)
                        
                avatar2
                    .offset(x: -100, y: 16)
                        
                avatar3
                    .offset(x: 20, y: -24)
            }
            
            Text("Let's start with\n The Nerdery!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(64)


            Button {
                authentication.updateValidation(success: true)
            } label: {
                RoundedRectangle(cornerRadius: 6)
                    .frame(height: 44)
                    .foregroundColor(Color.ellipse4)
                    .overlay {
                        HStack {
                            Image.googleIcon
                            
                            Text("Continue with Gmail")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
    
    var avatar1: some View {
        AvatarView(
            image: .avatar1,
            imageSize: .init(width: 78, height: 80),
            checkDialogRectangleOffset: .init(width: 88, height: -32),
            gradient: .gradient01,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var avatar2: some View {
        AvatarView(
            image: .avatar2,
            imageSize: .init(width: 78, height: 80),
            checkDialogRectangleOffset: .init(width: 88, height: -32),
            gradient: .gradient03,
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    var avatar3: some View {
        AvatarView(
            image: .avatar3,
            imageSize: .init(width: 160, height: 164),
            checkDialogRectangleOffset: .init(width: 64, height: -72),
            gradient: .init(colors: [.colorful04]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
