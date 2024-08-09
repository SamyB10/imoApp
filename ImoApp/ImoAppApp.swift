//
//  ImoAppApp.swift
//  ImoApp
//
//  Created by Boussair Samy on 21/07/2024.
//

import SwiftUI

@main
struct ImoAppApp: App {
    var body: some Scene {
        WindowGroup {
            constructHomeView()
        }
    }

    func constructHomeView() -> some View {
        var homeView = HomeView(viewModel: .viewModelSample)
        let homeInteractor = HomeInteractor()
        let homePresenter = HomePresenter()
        homeView.homeInteractor = homeInteractor
        homeInteractor.inject(presenter: homePresenter)
        homePresenter.inject(view: homeView)

        let homeTab = Tabs.Tab(view: homeView,
                               title: "Home",
                               image: "star")
        let tabs = Tabs(tab: [homeTab])
        return MainTabView(tabs: tabs)
    }
}

extension Font {
    static func customTitleFont(size: CGFloat) -> Font {
        return Font.custom("AnticDidone-Regular", size: size)
    }
}
