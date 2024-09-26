//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
////
//
import SwiftUI
struct CardView: View {
    private let viewModel: HomeViewModel.ViewModel.CardHomeViewModel
    let ratio: Double

    init(viewModel: HomeViewModel.ViewModel.CardHomeViewModel,
         ratio: Double) {
        self.viewModel = viewModel
        self.ratio = ratio
    }

    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(dvImage: .asset(viewModel.imageHouse),
                            ratio: ratio,
                            cornerRadius: 10,
                            contentMode: .fill)

            .overlay(alignment: .topTrailing) {
                FavoritesButtonView(item: viewModel)
            }
            detailHouse
                .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
    }


    private var detailHouse: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.titleHouse)
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(.semibold)

            Text(viewModel.addressHouse)
                .foregroundColor(.gray)
                .font(.body)
                .fontWeight(.medium)

            ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
        }
    }
}

