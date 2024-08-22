//
//  SectionCarousel.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct SectionCarousel: View {
    private let titleSection: String
    private let items: [CardHomeViewModel]

    init(titleSection: String,
         items: [CardHomeViewModel]) {
        self.titleSection = titleSection
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
                SectionHeaderView(title: titleSection)
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
