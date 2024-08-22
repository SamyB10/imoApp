//
//  TabView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import SwiftUI

struct Tabs {
    let tab: [Tab]

    struct Tab: Identifiable {
        let id = UUID()
        let view: AnyView
        let title: String
        let image: String

        init<Content: View>(view: Content,
                            title: String,
                            image: String) {
            self.view = AnyView(view)
            self.title = title
            self.image = image
        }
    }
}

struct MainTabView: View {
    var tabs: Tabs
    var body: some View {
        TabView {
            ForEach(tabs.tab) { tab in
                tab.view
                    .tabItem {
                        Label(tab.title,
                              systemImage: tab.image)
                    }
            }
        }
    }
}
