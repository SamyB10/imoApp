//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    private let header: HeaderViewModel
    private let items: [HomeViewModel.ViewModel.CardHomeViewModel]
    @State private var selectedItem: HomeViewModel.ViewModel.CardHomeViewModel?

    init(header: HeaderViewModel,
         items: [HomeViewModel.ViewModel.CardHomeViewModel]) {
        self.header = header
        self.items = items
    }

    var body: some View {
        Section {
            cardView()
        } header: {
            headerView()
        }
    }

    private func headerView() -> some View {
        VStack(alignment: .leading) {
            SectionHeaderView(viewModel: header)
        }
        .padding(.horizontal)
    }

    private func cardView() -> some View {
        LazyVStack {
            ForEach(items.indices, id: \.self) { itemIndex in
                let item = items[itemIndex]
                NavigationLink(value: item) {
                    CardView(viewModel: item, ratio: 16/9)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .id(itemIndex)
                }
                .foregroundStyle(.black)
            }
        }
    }
}
