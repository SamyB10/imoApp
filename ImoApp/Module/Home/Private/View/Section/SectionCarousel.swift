//
//  SectionCarousel.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct SectionCarousel: View {
    private let header: HeaderViewModel
    private let items: [HomeViewModel.ViewModel.CardHomeViewModel]
    @Environment(\.horizontalSizeClass) private var sizeClass
    @Namespace private var namespace

    init(header: HeaderViewModel,
         items: [HomeViewModel.ViewModel.CardHomeViewModel]) {
        self.header = header
        self.items = items
    }

    var body: some View {
        Section {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    createItemCarousel()
                        .padding(.bottom)
                }
                .onAppear {
                    proxy.scrollTo(items.count / 2, anchor: .center)
                }
            }
            .contentMargins(.horizontal, items.horizontalMarginScrollViewCarousel)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
        } header: {
            createHeader()
        }
    }

    private func createItemCarousel() -> some View {
        LazyHStack {
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
                                                    in: namespace))
                    } label: {
                        HomeCardView(viewModel: item, ratio: 16/9)
                            .matchedTransitionSource(id: item.id, in: namespace)
                            .id(itemIndex)
                            .containerRelativeFrame([.horizontal],
                                                    count: columns,
                                                    spacing: item.horizontalSpacing)
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
                            .id(itemIndex)
                            .containerRelativeFrame([.horizontal],
                                                    count: columns,
                                                    spacing: item.horizontalSpacing)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.black)
                }
            }
        }
    }

    private var columns: Int {
        sizeClass == .compact ? 1 : 2
    }

    private func createHeader() -> some View {
        VStack(alignment: .leading) {
            SectionHeaderView(viewModel: header)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
