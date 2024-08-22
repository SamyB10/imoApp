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
        switch section.itemHouse {
        case .carousel(let title, let items):
            SectionCarousel(titleSection: title, items: items)
        case .stacked(let title, let items):
            SectionStackedCard(titleSection: title, items: items)
        case .default(let title, let items):
            SectionDefault(titleSection: title, items: items)
        }    
    }
}



#Preview {
    HomeSection(section: HomeViewModel.SectionViewModel(itemHouse: .carousel(titleSection: HomeViewModel.TitleSection.paris.rawValue,
                                                                             CardHomeViewModel.viewModelSample)))
}
