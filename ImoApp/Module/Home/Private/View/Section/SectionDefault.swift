//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    private let header: HeaderViewModel
    private let items: [HomeViewModel.ViewModel.CardHomeViewModel]
    @State private var selectedItem: HomeViewModel.ViewModel.CardHomeViewModel?
    @Namespace private var animation

    init(header: HeaderViewModel,
         items: [HomeViewModel.ViewModel.CardHomeViewModel]) {
        self.header = header
        self.items = items
    }

    var body: some View {
        Section {
            cardView()
        } header: {
            headerView()
        }
    }

    private func headerView() -> some View {
        VStack(alignment: .leading) {
            SectionHeaderView(viewModel: header)
        }
        .padding(.horizontal)
    }

    private func cardView() -> some View {
        LazyVStack {
            ForEach(items.indices, id: \.self) { itemIndex in
                let item = items[itemIndex]
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
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .id(itemIndex)
                            .matchedTransitionSource(id: item.id, in: animation)
                    }
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
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .id(itemIndex)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.black)
                }
            }
        }
    }
}
