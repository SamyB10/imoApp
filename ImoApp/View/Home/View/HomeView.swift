//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//


import SwiftUI

struct HomeView: View {
//    var homeInteractor: HomeBusinessLogic?
//    @State private var viewModel: HomeViewModel
    @State private var navigateToNextPage = false

    // MARK: - Properties
    @ObservedObject private var manager: HomeViewManager

    init(manager: HomeViewManager) {
        self.manager = manager
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    GabaritListView(viewModel: manager.gabaritListViewModel)
                    ForEach(manager.viewModel.section, id: \.self) { section in
                        HomeSection(section: section)
                    }
                }
            }
            .navigationTitle("Home")
            .background(.ultraThickMaterial)
        }
        .onAppear {
            manager.didLoad()
        }
    }
}
