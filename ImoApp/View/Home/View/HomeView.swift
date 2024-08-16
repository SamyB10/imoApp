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
                    withAnimation {
                        sectionGabaritList
                    }
                    ForEach(manager.viewModel.section, id: \.self) { section in
                        HomeSection(section: section)
                    }
                }
            }
            .navigationTitle( "Home" )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ImageLoaderView(dvImage: .asset("Avatar"),
                                    contentMode: .fit)
                    .frame(width: 30, height: 30)
                }
            }
            .background(.ultraThickMaterial)
//            .background(.testHome)
        }
        .onAppear {
            manager.didLoad()
        }
    }

    private var sectionGabaritList: some View {
        Section {
            GabaritListView(viewModel: manager.gabaritListViewModel) { action in
                manager.didSelectItemGabaritList(with: action)
            }
                .padding(.bottom)
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(cleanFilter: true,
                                   title: manager.gabaritListViewModel.titleSection) {
                    manager.didSelectItemGabaritList(with: .clean)
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

#Preview {
    let service = RequestHome()
    let interactor = HomeInteractor(service: service)
    let manager = HomeViewManager(interacor: interactor,
                                  viewModel: .viewModelSample,
                                  gabaritListViewModel: .viewModel)
    return HomeView(manager: manager)
}
