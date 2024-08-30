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
    @State private var show: Bool = true

    init(manager: HomeViewManager) {
        self.manager = manager
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical) {
                    section
                }
                .navigationTitle(manager.searchLocationViewModel.selectedLocation ?? "Nil")
                .toolbar {
                    ToolBarView()
                }
                .background(.ultraThickMaterial)
                SearchSuggestionView(searchLocationViewModel: manager.searchLocationViewModel)
            }
        }
        .searchable(text: $manager.searchLocationViewModel.searchText, prompt: "Region, Department, City")
        .onChange(of: manager.searchLocationViewModel.searchText) {
            manager.searchLocationViewModel.search()
        }
        .onAppear {
            manager.didLoad()
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
                                  viewModel: .homeViewModelSample)
    return HomeView(manager: manager)
}
