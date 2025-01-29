//
//  FavoriteView.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/09/2024.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [HomeViewModel.ViewModel.CardHomeViewModel]
    @Namespace private var animation

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                if items.isEmpty {
                    ContentUnavailableView("No favorites", image: "star", description: Text("You don't have any favorites yet."))
                        .symbolVariant(.slash)
                } else {
                    cardView()
                }
            }

            .contentMargins(.horizontal, 20, for: .scrollContent)
            .background(.ultraThickMaterial)
            .navigationTitle("Favorites")

            .toolbar {
                ToolBarView(viewModel: ToolBarViewModel(appearance: .avatar))
            }

            .navigationDestination(for: HomeViewModel.ViewModel.CardHomeViewModel.self) { item in
                DetailPageView(viewModel: .init(id: item.id,
                                                image: item.imageHouse,
                                                title: item.titleHouse,
                                                ownerName: "Samy",
                                                price: Int(item.price)))
            }
        }

    }

    private func cardView() -> some View {
        LazyVStack {
            ForEach(items) { item in
                if #available(iOS 18.0, *) {
                    NavigationLink {
                        DetailPageView(viewModel: .init(id: item.id,
                                                        image: item.imageHouse,
                                                        title: item.titleHouse,
                                                        ownerName: "Samy",
                                                        price: Int(item.price)))
                        .navigationTransition(.zoom(sourceID: item.id,
                                                    in: animation))
                    } label: {
                        HomeCardView(viewModel: item, ratio: 16/9)
                    }
                    .matchedTransitionSource(id: item.id, in: animation)
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.black)
                } else {
                    NavigationLink {
                        DetailPageView(viewModel: .init(id: item.id,
                                                        image: item.imageHouse,
                                                        title: item.titleHouse,
                                                        ownerName: "Samy",
                                                        price: Int(item.price)))
                    } label: {
                        HomeCardView(viewModel: item, ratio: 16/9)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    FavoriteView()
}
