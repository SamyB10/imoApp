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
                NavigationLink(value: item) {
                    CarouselView(viewModel: item)
                        .id(itemIndex)
                }
                .foregroundColor(.black)
            }
        }
        .padding(.bottom)
    }

    private func createHeader() -> some View {
        VStack(alignment: .leading) {
            SectionHeaderView(viewModel: header)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
