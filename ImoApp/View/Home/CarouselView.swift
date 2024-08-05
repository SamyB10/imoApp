//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import SwiftUI
struct CarouselView: View {
    @State var viewModel: CarouselViewModel
    @State private var isPressed = false
    @State private var navigateToNextPage = false
    @Environment(\.horizontalSizeClass) private var sizeClass

    private var columns: Int {
        sizeClass == .compact ? 1 : viewModel.regularCount
    }

    var body: some View {
        VStack(alignment: .leading) {
            imageHouse
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .gesture(handleGesture)
                .animation(.spring(response: 0.6, dampingFraction: 0.6), value: isPressed)
           
            NavigationLink(destination: Text(""), isActive: $navigateToNextPage) {
                EmptyView()
            }

            Spacer()

            detailHouse
                .padding()
        }
        .background(Color.white)
        .cornerRadius(viewModel.cornerRadius)
    }

    private var imageHouse: some View {
        Image(viewModel.imageHouse)
            .resizable()
            .cornerRadius(viewModel.cornerRadius)
            .aspectRatio(viewModel.ratio, contentMode: .fit)
            .containerRelativeFrame([.horizontal],
                                    count: columns,
                                    spacing: viewModel.hSpacing)

    }

    @ViewBuilder
    private var detailHouse: some View {
        let itemDetailHouse = ItemDetailHouse.allCases
        VStack(alignment: .leading,
               spacing: 20) {
            Text(viewModel.titleHouse)
                .font(.customTitleFont(size: 22))
                .foregroundColor(.black)

            Text(viewModel.addressHouse)
                .foregroundColor(.black)

            HStack {
                ForEach(itemDetailHouse, id: \.self) { item in
                    switch item {
                    case .numberOfRoom:
                        createItemDetailHouse(with: String(viewModel.numberRoom))
                    case .price:
                        createItemDetailHouse(with: String(viewModel.price))
                    case .surface:
                        createItemDetailHouse(with: "\(String(viewModel.houseSurfaceArea))m2")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func createItemDetailHouse(with text: String)-> some View {
        ZStack {
            Color.clear
                .frame(width: 80, height: 40)
                .border(.yellow, width: 2.5)
                .cornerRadius(5)
            Text("\(text)")
                .font(.subheadline)
                .bold()
                .foregroundStyle(.black)
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
}

#Preview {
    CarouselView(viewModel: .viewModelTest)
}
