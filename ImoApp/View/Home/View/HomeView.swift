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
    @State private var searchIsActive: Bool = false
    @ObservedObject private var manager: HomeViewManager
    @State private var searchText: String = ""
//    @StateObject private var searchLocationViewModelTest = SearchLocationViewModelTest()

    init(manager: HomeViewManager) {
        self.manager = manager
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                section
            }
            .navigationTitle( "Home" )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolBarCustom()
            }
            .background(.ultraThickMaterial)
        }
        .searchable(text: $manager.searchLocationViewModel.searchText, prompt: "Region, Department, Location") {
            if !manager.searchLocationViewModel.searchText.isEmpty {
                listLocationSuggestions
            }
        }

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
            Button(action: {
                // Action lorsqu'une suggestion est sélectionnée.
                manager.searchLocationViewModel.searchText = suggestion.title
                manager.searchLocationViewModel.suggestions.removeAll() // Masquer les suggestions après la sélection
                print(suggestion.title) // Afficher la suggestion sélectionnée
            }) {
                Text(suggestion.title)
                    .foregroundStyle(.black)
                    .searchCompletion(suggestion.title)
            }
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
