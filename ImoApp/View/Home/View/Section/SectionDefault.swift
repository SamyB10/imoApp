//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    var section: HomeViewModel.SectionViewModel

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    createDefaultItem
                }
            }
            .contentMargins(.horizontal, section.horizontalMarginScrollView)

        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: section.titleSection.rawValue)
            }
            .padding()
        }
    }

    private var createDefaultItem: some View {
        ForEach(section.itemHouse) { item in
            switch section.titleSection {
            case .lyon,
                    .nantes,
                    .strasbourg:
                CardView(height: 200, width: 150)
                    .cornerRadius(10)
            default:
                CardView(height: 120, width: 120)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SectionDefault(section: HomeViewModel.SectionViewModel(titleSection: .lyon,
                                                           itemHouse: Array(repeating: .viewModelTest,
                                                                            count: 10)))
}
