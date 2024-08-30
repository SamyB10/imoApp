//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
////
//
import SwiftUI
struct CardViewTest: View {
    private let viewModel: CardHomeViewModel
    @State private var addFavorite: Bool = false

    init(viewModel: CardHomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(dvImage: .asset(viewModel.imageHouse),
                            ratio: 16/9,
                            cornerRadius: 10,
                            contentMode: .fill)

            .overlay(alignment: .topTrailing) {
                FavoritesButtonView()
            }
            detailHouse
        }
        .background(Color.white)
        .cornerRadius(10)
    }

    @ViewBuilder
    private var detailHouse: some View {
        VStack(alignment: .leading,
               spacing: 20) {
            Text(viewModel.titleHouse)
                .font(.customTitleFont(size: 22))
                .foregroundColor(.black)

            Text(viewModel.addressHouse)
                .foregroundColor(.black)

            ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
        }
               .padding()
    }
}

#Preview {
    CardViewTest(viewModel: .viewModelTest)
        .frame(width: .infinity, height: 300)
        .padding()
}

