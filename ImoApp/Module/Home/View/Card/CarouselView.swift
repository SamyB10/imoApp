//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import SwiftUI
struct CarouselView: View {
    private let viewModel: CardHomeViewModel
    @State private var isPressed = false
    @State private var navigateToNextPage = false
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    init(viewModel: CardHomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {

        VStack(alignment: .leading) {
            imageHouse
            // MARK: Review gesture for not conflict between scrool View and item Gesture
                .scaleEffect(isPressed ? 0.90 : 1.0)
                .onTapGesture {
                    navigateToNextPage = true
                }
                .gesture(handleGesture)
                .animation(.spring(), value: isPressed)

            Spacer()

            detailHouse
                .padding()
        }

        .background(.white)
        .cornerRadius(viewModel.cornerRadius)
        .navigationDestination(isPresented: $navigateToNextPage) {
            DetailPageView(viewModel: DetailPageViewModel(image: viewModel.imageHouse,
                                                          title: viewModel.titleHouse,
                                                          ownerName: "Samy",
                                                          price: Int(viewModel.price)))
        }
    }

    private var imageHouse: some View {
        ImageLoaderView(dvImage: .asset(viewModel.imageHouse),
                        ratio: viewModel.ratio,
                        cornerRadius: viewModel.cornerRadius,
                        contentMode: .fit)
        .overlay(alignment: .topTrailing) {
            FavoritesButtonView()
        }
        .containerRelativeFrame([.horizontal],
                                count: columns,
                                spacing: viewModel.horizontalSpacing)
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
    }

    private var handleGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { gesture in
                isPressed = true
                if gesture.startLocation != gesture.predictedEndLocation {
                    isPressed = false
                }
            }
            .onEnded { value in
                isPressed = false
                if value.startLocation == value.predictedEndLocation {
                    navigateToNextPage = true
                }
            }
    }

    private var columns: Int {
        sizeClass == .compact ? 1 : viewModel.regularCount
    }
}

#Preview {
    CarouselView(viewModel: .viewModelTest)
}
