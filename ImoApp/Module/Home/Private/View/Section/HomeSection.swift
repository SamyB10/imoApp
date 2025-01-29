//
//  HomeSection.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import SwiftUI
struct HomeSection: View {
    var section: HomeViewModel.ViewModel.SectionViewModel
    var body: some View {
        switch section.itemHouse {
        case let .carousel(items):
            SectionCarousel(header: section.header, items: items)
        case let .stacked(items):
            SectionStackedCard(header: section.header, items: items)
        case let .default(items):
            SectionDefault(header: section.header, items: items)
        }
    }
}
