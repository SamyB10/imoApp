//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    var titleSection: String
    var items: [CardHomeViewModel]

    @State private var selectedItem: CardHomeViewModel?
    @State private var navigateToNextPage = false


    var body: some View {
        Section {
            LazyVStack {
                ForEach(items) { item in
                    CardViewTest(viewModel: item)
                        .padding()
                        .onTapGesture {
                            selectedItem = item
                            navigateToNextPage = true
                        }
                }
            }
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: titleSection)
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
    SectionDefault(titleSection: HomeViewModel.TitleSection.lyon.rawValue,
                   items: CardHomeViewModel.viewModelSample)
}
