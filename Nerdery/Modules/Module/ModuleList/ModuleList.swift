//
//  ModuleList.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct ModuleList: View {
    var body: some View {
        VStack {
            Text("Module List")
            
            NavigationLink(destination: ModuleDetails()) {
                Text("Detail")
            }
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList()
    }
}
