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
                    HStack {
                        createItemCarousel
                    }
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
            VStack(alignment: .leading) {
                SectionHeaderView(viewModel: header)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    private var createItemCarousel: some View {
        ForEach(items.indices, id: \.self) { itemIndex in
            let item = items[itemIndex]
            CarouselView(viewModel: item)
                .id(itemIndex)
        }
    }
}
