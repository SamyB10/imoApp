//
//  SectionStackedCard.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionStackedCard: View {
    var section: HomeViewModel.SectionViewModel
    var body: some View {
        Section {
            createItemStackedCard
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: section.titleSection.rawValue)
            }
            .padding()
        }
    }

    private var createItemStackedCard: some View {
        StackedCardView()
            .frame(height: 200)
            .padding(.trailing, 30)
            .frame(width: UIScreen.main.bounds.width)
    }
}
