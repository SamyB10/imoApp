//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//


import SwiftUI

struct HomeSectionViewModel: Equatable, Hashable {
    let titleSection: TypeSection
    let itemHouse: [CardHomeViewModel]

    enum TypeSection: String, Hashable, CaseIterable {
        case paris = "Paris"
        case marseille = "Marseille"
        case lyon = "Lyon"
        case toulouse = "Toulouse"
        case nice = "Nice"
        case nantes = "Nantes"
        case montpellier = "Montpellier"
        case strasbourg = "Strasbourg"
    }
}

extension HomeSectionViewModel {
    var horizontalMarginScrollView: CGFloat {
#if os(macOS)
        40.0
#else
        20.0
#endif
    }
}


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
