//
//  SectionCarousel.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct SectionCarousel: View {
    var section: HomeViewModel.SectionViewModel
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    createItemCarousel
                }
            }
            //            .simultaneousGesture(DragGesture())
            .contentMargins(.horizontal, section.horizontalMarginScrollView)
            .scrollTargetBehavior(.paging)
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: section.titleSection.rawValue)
            }
            .padding()
        }
    }

    private var createItemCarousel: some View {
        ForEach(section.itemHouse) { item in
            CarouselView(viewModel: item)
        }
    }
}
