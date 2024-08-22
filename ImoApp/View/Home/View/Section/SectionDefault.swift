//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    private let titleSection: String
    private let items: [CardHomeViewModel]
    @State private var selectedItem: CardHomeViewModel?
    @State private var navigateToNextPage = false

    init(titleSection: String, items: [CardHomeViewModel]) {
        self.titleSection = titleSection
        self.items = items
    }

    var body: some View {
        Section {
            LazyVStack {
                ForEach(items) { item in
                    CardViewTest(viewModel: item)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            selectedItem = item
                            navigateToNextPage = true
                        }
                }
            }
        } header: {
            VStack(alignment: .leading) {
                SectionHeaderView(title: titleSection)
            }
            .padding(.horizontal)
        }
        .navigationDestination(isPresented: $navigateToNextPage) {
            if let selectedItem = selectedItem {
                DetailPageView(viewModel: DetailPageViewModel(image: selectedItem.imageHouse,
                                                              title: selectedItem.titleHouse,
                                                              ownerName: "Samy",
                                                              price: Int(selectedItem.price)))
            }
        }
    }
}

#Preview {
    SectionDefault(titleSection: HomeViewModel.TitleSection.paris.rawValue,
                   items: CardHomeViewModel.viewModelSample)
}
