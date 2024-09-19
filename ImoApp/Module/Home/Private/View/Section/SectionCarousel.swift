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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    createItemCarousel
                }
                .padding(.bottom)
            }
            .contentMargins(.horizontal, items.horizontalMarginScrollViewCarousel)
            .scrollTargetBehavior(.paging)
        } header: {
            VStack(alignment: .leading) {
                SectionHeaderView(viewModel: header)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    private var createItemCarousel: some View {
        ForEach(items) { item in
            CarouselView(viewModel: item)
        }
    }
}
