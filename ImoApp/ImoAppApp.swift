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

    private func constructHomeView() -> some View {
        let service = RequestHome()
        let viewModel = HomeViewModel.ViewModel.homeViewModelSample
        let homeInteractor = HomeInteractor(service: service)
        let homePresenter = HomePresenter()
        let searchLocationViewModel = SearchLocationViewModel()
        let manager = HomeViewManager(interacor: homeInteractor,
                                      searchLocationViewModel: searchLocationViewModel,
                                      viewModel: viewModel)

        let homeView = HomeView(manager: manager)
        homeInteractor.inject(presenter: homePresenter)
        homePresenter.inject(display: manager)

        let homeTab = Tabs.Tab(view: homeView,
                               title: "Home",
                               image: "star")
        let tabs = Tabs(tab: [homeTab])
        return MainTabView(tabs: tabs)
    }
}
