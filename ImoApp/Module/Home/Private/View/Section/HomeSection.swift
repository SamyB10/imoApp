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
        case .carousel(_, let items):
            SectionCarousel(header: section.header, items: items)
        case .stacked(_, let items):
            SectionStackedCard(header: section.header, items: items)
        case .default(_, let items):
            SectionDefault(header: section.header, items: items)
        }
    }
}
