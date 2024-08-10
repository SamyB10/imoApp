//
//  HomeSection.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import SwiftUI
struct HomeSection: View {
    var section: HomeViewModel.SectionViewModel
    var body: some View {
        switch section.titleSection {
        case .paris:
            SectionCarousel(section: section)
        case .marseille:
            SectionStackedCard(section: section)
        default:
            SectionDefault(section: section)
        }
    }
}

#Preview {
    HomeSection(section: HomeViewModel.SectionViewModel(titleSection: .lyon,
                                                        itemHouse: [CardHomeViewModel.viewModelTest]))
}
