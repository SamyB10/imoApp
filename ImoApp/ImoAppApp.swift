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
//
//    let service = RequestHome()
//    let viewModel = HomeViewModel.sampleViewModel
//    let homePresenter = HomePresenter(service: service,
//                                      viewModel: viewModel)
//    let homeInteractor = HomeInteractor(presenter: homePresenter,
//                                        service: service)
//    let manager = HomeViewManager(interacor: homeInteractor,
//                                  viewModel: viewModel)
//    let _ = homePresenter.inject(display: manager)


    func constructHomeView() -> some View {
        let service = RequestHome()
        let viewModel = HomeViewModel.viewModelSample
        let gabaritListViewModel = GabaritListViewModel.viewModel

        let homeInteractor = HomeInteractor(service: service)
        let homePresenter = HomePresenter()
        let manager = HomeViewManager(interacor: homeInteractor,
                                      viewModel: viewModel,
                                      gabaritListViewModel: gabaritListViewModel)

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
