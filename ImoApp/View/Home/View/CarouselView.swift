//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import SwiftUI
struct CarouselView: View {
    @State var viewModel: CardHomeViewModel
    @State private var isPressed = false
    @State private var navigateToNextPage = false
    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                imageHouse
                // MARK: Review gesture for not conflict between scrool View and item Gesture
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                    .gesture(handleGesture)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6), value: isPressed)

                Spacer()

                detailHouse
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(viewModel.cornerRadius)
        }
        .navigationDestination(isPresented: $navigateToNextPage) {
            DetailPageView(viewModel: .sampleViewModel)
        }
    }

    private var imageHouse: some View {
        ImageLoaderView(dvImage: .asset(viewModel.imageHouse),
                        ratio: viewModel.ratio,
                        cornerRadius: viewModel.cornerRadius,
                        contentMode: .fit)
        .containerRelativeFrame([.horizontal],
                                count: columns,
                                spacing: viewModel.hSpacing)
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
