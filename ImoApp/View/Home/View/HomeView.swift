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
//                    SearchWithSuggestionsView()
                    section
                }
                .navigationTitle(manager.searchLocationViewModel.locationChoice ?? "Nil")
//                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolBarCustom()
                }
                .background(.ultraThickMaterial)
//                if show {
                    SearchedView(searchLocationViewModel: manager.searchLocationViewModel)
//                }
            }
        }
        .searchable(text: $manager.searchLocationViewModel.searchText, prompt: "Region, Department, City")
        .onChange(of: manager.searchLocationViewModel.searchText) {
//            show = true
            manager.searchLocationViewModel.search()
        }
        .onAppear {
            manager.didLoad()
        }

//        .onSubmit(of: .search) {
////            show = false
//        }
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
