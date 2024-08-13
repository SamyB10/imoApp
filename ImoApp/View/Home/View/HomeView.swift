//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//


import SwiftUI

struct HomeView: View {
    var homeInteractor: HomeBusinessLogic?
    @State private var viewModel: HomeViewModel
    @State private var navigateToNextPage = false

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    GabaritListView(viewModel: .viewModel)
                    ForEach(viewModel.section, id: \.self) { section in
                        HomeSection(section: section)
                    }
                }
            }
            .navigationTitle("Home")
            .background(.ultraThickMaterial)
        }
    }
}

extension HomeView: HomeDisplayLogic {
    func displayInterface() {
        print("dis")
    }
}

#Preview {
    HomeView(viewModel: .viewModelSample)
}
