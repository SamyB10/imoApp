//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//


import SwiftUI
import MapKit

struct HomeView: View {

    // MARK: - Properties
    @ObservedObject private var manager: HomeViewManager

    init(manager: HomeViewManager) {
        self.manager = manager
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                section
            }
            .background(.ultraThickMaterial)

            .navigationTitle(manager.searchLocationViewModel.selectedLocation ?? "S&B")
            .toolbar {
                ToolBarView(viewModel: ToolBarViewModel(appearance: .all))
            }
            SearchSuggestionView(searchLocationViewModel: manager.searchLocationViewModel)
                .navigationDestination(for: HomeViewModel.ViewModel.CardHomeViewModel.self) { item in
                    let viewModel = DetailPageViewModel(id: item.id,
                                                        image: item.imageHouse,
                                                        title: item.titleHouse,
                                                        ownerName: "Samy",
                                                        price: Int(item.price))

                    Navigation.navigationToDetailPage(with: viewModel)
                }
        }
        .searchable(text: $manager.searchLocationViewModel.searchText,
                    placement: .automatic,
                    prompt: "Region, Department, City")
        .onChange(of: manager.searchLocationViewModel.searchText) {
            manager.searchLocationViewModel.search()
        }
        .onAppear {
            //            manager.didLoad()
        }
    }


    private var section: some View {
        VStack(alignment: .leading) {
            ForEach(manager.viewModel.section, id: \.self) { section in
                HomeSection(section: section)
            }
        }
    }

    private var listLocationSuggestions: some View {
        ForEach(manager.searchLocationViewModel.suggestions, id: \.self) { suggestion in
            Text(suggestion.title)
                .foregroundStyle(.black)
                .searchCompletion(suggestion.title)
        }
    }
}

#Preview {
    let service = RequestHome()
    let interactor = HomeInteractor(service: service)
    let manager = HomeViewManager(interacor: interactor,
                                  searchLocationViewModel: SearchLocationViewModel(),
                                  viewModel: HomeViewModel.ViewModel.homeViewModelSample)
    HomeView(manager: manager)
}
