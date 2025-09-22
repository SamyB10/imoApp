//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//
import SwiftUI
struct HomeCardView: View {
    private let viewModel: HomeViewModel.ViewModel.CardHomeViewModel
    private let ratio: CGFloat

    init(viewModel: HomeViewModel.ViewModel.CardHomeViewModel,
         ratio: Double) {
        self.viewModel = viewModel
        self.ratio = ratio
    }

    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(dvImage: .asset(viewModel.imageHouse),
                            ratio: ratio,
                            cornerRadius: 20,
                            contentMode: .fill)

            .overlay(alignment: .topTrailing) {
                FavoritesButtonView(item: viewModel)
            }
            detailHouse
                .padding(.top, 5)
                .padding([.bottom, .horizontal])
        }
        .background(Color.white)
        .cornerRadius(20)
    }


    private var detailHouse: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.titleHouse)
                .font(.system(size: 15))
                .foregroundColor(.black)
                .fontWeight(.semibold)

            Text(viewModel.addressHouse)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .fontWeight(.light)

            Text("\(viewModel.price.formatted()) €")
                .font(.system(size: 12))
                .foregroundColor(.black)
                .fontWeight(.semibold)

            ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
        }
    }
}
