//
//  TestMenu.swift
//  ImoApp
//
//  Created by Boussair Samy on 17/09/2024.
//

import SwiftUI

struct TestMenu: View {
    var body: some View {
        NavigationView {
            Text("Something important to show")
                .padding()
                .navigationTitle("Menu")
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Button("first") {  }
                            Button("second") {  }
                            Menu {
                                Button("third") {  }
                                Button("forth") {  }
                            } label: {
                                Label("More", systemImage: "folder.circle")
                            }; Button("Delete", role: .destructive) { }
                        } label: {
                                Label("Menu", systemImage: "ellipsis.circle")
                            }
                    }
                }
        }
    }
}

#Preview {
    TestMenu()
}
