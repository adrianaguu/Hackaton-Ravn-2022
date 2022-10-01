//
//  ModuleList.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct ModuleList: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack{
                    NavigationLink(destination: ModuleDetails()) {
                        Text("Module")
                    }
                }
            }
            .navigationTitle("Modules")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList()
    }
}
