//
//  HouseItemView.swift
//  ImoApp
//
//  Created by Boussair Samy on 08/08/2024.
//

import SwiftUI

struct StackedCardView: View {
    @State private var navigateToNextPage = false
    @State var viewModel: CardHomeViewModel

    var body: some View {
        cardView(with: viewModel)
            .onTapGesture {
                navigateToNextPage = true
            }

            .navigationDestination(isPresented: $navigateToNextPage) {
                DetailPageView(viewModel: DetailPageViewModel(image: viewModel.imageHouse,
                                                              title: viewModel.titleHouse,
                                                              ownerName: "Samy",
                                                              price: Int(viewModel.price)))
            }
    }

    private func cardView(with item: CardHomeViewModel) -> some View {
        Image(item.imageHouse)
            .resizable()
            .cornerRadius(15)
            .padding(.horizontal)
    }
}

#Preview {
    StackedCardView(viewModel: .viewModelTest)
}
