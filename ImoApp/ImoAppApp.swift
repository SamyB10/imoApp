//
//  ImoAppApp.swift
//  ImoApp
//
//  Created by Boussair Samy on 21/07/2024.
//

import SwiftUI
import SwiftData

@main
struct ImoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            HomeViewModel.ViewModel.CardHomeViewModel.self,
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            constructHomeView()
                .modelContainer(sharedModelContainer)
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

        let favoriteView = FavoriteView()

        let homeTab = Tabs.Tab(view: homeView,
                               title: "Home",
                               image: "house.fill")

        let favoriteTab = Tabs.Tab(view: favoriteView,
                                   title: "Favorites",
                                   image: "star.fill")
        let tabs = Tabs(tab: [homeTab, favoriteTab])
        return MainTabView(tabs: tabs)
    }
}
