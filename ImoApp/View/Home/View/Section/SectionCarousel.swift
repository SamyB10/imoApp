//
//  SectionCarousel.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct SectionCarousel: View {
    var titleSection: String
    var items: [CardHomeViewModel]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    createItemCarousel
                }
            }
            .contentMargins(.horizontal, items.horizontalMarginScrollViewCarousel)
            .scrollTargetBehavior(.paging)
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: titleSection)
            }
            .padding()
        }
    }
    
    private var createItemCarousel: some View {
        ForEach(items) { item in
            CarouselView(viewModel: item)
        }
    }
}
