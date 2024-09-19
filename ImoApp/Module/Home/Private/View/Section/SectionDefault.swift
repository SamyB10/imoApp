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
    @State private var navigateToNextPage = false

    init(header: HeaderViewModel,
         items: [HomeViewModel.ViewModel.CardHomeViewModel]) {
        self.header = header
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
                SectionHeaderView(viewModel: header)
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
    SectionDefault(header: HeaderViewModel(apperance: .home, title: "Test"),
                   items: HomeViewModel.ViewModel.CardHomeViewModel.viewModelSample)
}
