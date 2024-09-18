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
        case .carousel(let title, let items):
            SectionCarousel(header: section.header, items: items)
        case .stacked(let title, let items):
            SectionStackedCard(header: section.header, items: items)
        case .default(let title, let items):
            SectionDefault(header: section.header, items: items)
        }
    }
}
