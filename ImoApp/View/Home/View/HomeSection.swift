//
//  HomeSection.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import SwiftUI

struct HomeSection: View {
    var section: HomeSectionViewModel
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                createItem(with: section.itemHouse)
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


    private func createItem(with items: [CardHomeViewModel]) -> some View {
        HStack(spacing: items.hSpacing) {
            ForEach(items) { item in
                switch section.titleSection {
                case .paris:
                    CarouselView(viewModel: item)
                case .marseille:
                    HouseCardItemView()
                        .frame(height: 200)
                        .padding(.trailing, 30)
                        .frame(width: UIScreen.main.bounds.width)
                default:
                    Color.red
                }
            }
        }
    }
}

#Preview {
    HomeSection(section: .init(titleSection: .lyon,
                               itemHouse: [CardHomeViewModel.viewModelTest]))
}
