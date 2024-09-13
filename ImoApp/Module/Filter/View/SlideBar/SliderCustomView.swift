//
//  SliderCustomView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/09/2024.
//

import SwiftUI

struct SliderCustomView: View {
    private let rangeMinPrice: Int = 0
    private let rangeMaxPrice: Int = 1000000
    private let spaceBetween: CGFloat = 0.05
    private let heightSlider: CGFloat = 5
    private let stepValue: Int = 20000
    private let cell: FilterViewModel.Slider
    @ObservedObject private var viewModel: SliderViewModel
    @State private var widthCircle: CGFloat = 24
    @State private var totalSizeRectangle: CGSize = .zero
    private var paddingHorizontalRectangle: CGFloat = 40
    let action: (SelectedFilterItem) -> Void

    public init(cell: FilterViewModel.Slider,
                viewModel: SliderViewModel,
                action: @escaping (SelectedFilterItem) -> Void) {
        self.cell = cell
        self.viewModel = viewModel
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
            createRectangleSlider()
                createHandleSlider()
            }
            .padding(.bottom)

            createTextFieldView()
        }
    }
}


// MARK: View
extension SliderCustomView {
    private func createHandleSlider() -> some View {
        HStack(spacing: 0) {
            CircleSlider(width: widthCircle)
                .offset(x: getOffsetCircleMin())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newValue = max(0, min(value.location.x / totalSizeRectangle.width, getPosition(from: viewModel.priceMax) - spaceBetween))
                            let roundedPrice = roundToStep(getPrice(from: newValue))
                            action(.priceSlider(roundedPrice, Int(viewModel.priceMax)))
                        }
                )

            CircleSlider(width: widthCircle)
                .offset(x: getOffsetCircleMax())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newValue = min(1, max(value.location.x / totalSizeRectangle.width, getPosition(from: viewModel.priceMin) + spaceBetween))
                            let roundedPrice = roundToStep(getPrice(from: newValue))
                            action(.priceSlider(Int(viewModel.priceMin), roundedPrice))
                        }
                )
        }
    }

    private func createRectangleSlider() -> some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.20))
                .frame(height: heightSlider)

                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                totalSizeRectangle = proxy.size
                            }
                    }
                )

            Rectangle()
                .foregroundStyle(.black)
                .frame(width: getWidthRectangle(),
                       height: heightSlider)
                .offset(x: getPositionRectangleBlack(from: viewModel.priceMin) * totalSizeRectangle.width)
        }
    }

    private func createTextFieldView() -> some View {
        HStack {
            VStack(alignment: .center) {
                Text("Minimum")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                TextFieldViewPrice(viewModel: cell.textFieldViewModel(for: true)) {
                    action(.priceSlider(Int($0), Int(viewModel.priceMax)))
                }
            }

            Spacer()

            VStack(alignment: .center) {
                Text("Maximum")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                TextFieldViewPrice(viewModel: cell.textFieldViewModel(for: false)) {
                    action(.priceSlider(Int(viewModel.priceMin), Int($0)))
                }
            }
        }
    }
}

// MARK: CalculLogic
extension SliderCustomView {
    private func getWidthRectangle() -> CGFloat {
        var minPrice: Double
        var maxPrice: Double

        if Int(viewModel.priceMin) < rangeMinPrice {
            minPrice =  Double(rangeMinPrice)
        } else if Int(viewModel.priceMin) >= rangeMaxPrice {
            minPrice = Double(rangeMinPrice)
        } else {
            minPrice = viewModel.priceMin
        }


        if Int(viewModel.priceMax) >= rangeMaxPrice {
            maxPrice = Double(rangeMaxPrice)
        } else {
            maxPrice = viewModel.priceMax
        }

        return (getPosition(from: maxPrice) - getPosition(from: minPrice)) * totalSizeRectangle.width
    }

    private func getOffsetCircleMax() -> CGFloat {
        var maxPrice: Double
        if Int(viewModel.priceMax) >= rangeMaxPrice {
            maxPrice = Double(rangeMaxPrice)
        } else {
            maxPrice = viewModel.priceMax
        }
        return getPosition(from: maxPrice) * totalSizeRectangle.width - paddingHorizontalRectangle
    }

    private func getOffsetCircleMin() -> CGFloat {
        var minPrice: Double

        if Int(viewModel.priceMin) < rangeMinPrice {
            minPrice =  Double(rangeMinPrice)
        } else if Int(viewModel.priceMin) >= rangeMaxPrice {
            minPrice = Double(rangeMinPrice)
        } else {
            minPrice = viewModel.priceMin
        }
        return getPosition(from: minPrice) * totalSizeRectangle.width - paddingHorizontalRectangle + (widthCircle + widthCircle * 0.1)
    }


    private func getPrice(from value: CGFloat) -> Int {
        return Int(value * CGFloat(rangeMaxPrice - rangeMinPrice)) + rangeMinPrice
    }

    private func getPosition(from price: Double) -> CGFloat {
        let value = Int(price)
        return CGFloat(value - rangeMinPrice) / CGFloat(rangeMaxPrice - rangeMinPrice)
    }

    private func getPositionRectangleBlack(from price: Double) -> CGFloat {
        var minPrice: Int
        if Int(viewModel.priceMin) < rangeMinPrice {
            minPrice =  rangeMinPrice
        } else if Int(viewModel.priceMin) >= rangeMaxPrice {
            minPrice = rangeMinPrice
        } else {
            minPrice = Int(viewModel.priceMin)
        }
        return CGFloat(minPrice - rangeMinPrice) / CGFloat(rangeMaxPrice - rangeMinPrice)
    }

    private func roundToStep(_ price: Int) -> Int {
        let step = stepValue
        return (price / step) * step
    }
}
