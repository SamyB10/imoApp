//
//  SliderCustomView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/09/2024.
//

import SwiftUI

struct SliderCustomView: View {
    private let cell: FilterViewModel.Slider
    @ObservedObject private var viewModel: SliderViewModel
    @State private var widthCircle: CGFloat = 24
    @State private var totalSizeRectangle: CGSize = .zero
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
                            let newValue = max(0, min(value.location.x / totalSizeRectangle.width, getPosition(from: viewModel.valueMax) - viewModel.spaceBetween))
                            let roundedPrice = roundToStep(getPrice(from: newValue))
                            action(cell.selectedItem(with: .min(value: roundedPrice)))
                        }
                )

            CircleSlider(width: widthCircle)
                .offset(x: getOffsetCircleMax())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newValue = min(1, max(value.location.x / totalSizeRectangle.width, getPosition(from: viewModel.valueMin) + viewModel.spaceBetween))
                            let roundedPrice = roundToStep(getPrice(from: newValue))
                            action(cell.selectedItem(with: .max(value: roundedPrice)))
                        }
                )
        }
    }

    private func createRectangleSlider() -> some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.20))
                .frame(height: viewModel.heightSlider)

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
                       height: viewModel.heightSlider)
                .offset(x: getPositionRectangleBlack() * totalSizeRectangle.width)
        }
    }

    private func createTextFieldView() -> some View {
        HStack {
            VStack(alignment: .center) {
                Text("Minimum")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                TextFieldViewPrice(viewModel: cell.textFieldViewModel(with: .min)) {
                    action(cell.selectedItem(with: .min(value: $0)))
                }
            }

            Spacer()

            VStack(alignment: .center) {
                Text("Maximum")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                TextFieldViewPrice(viewModel: cell.textFieldViewModel(with: .max)) {
                    action(cell.selectedItem(with: .max(value: $0)))
                }
            }
        }
    }
}

// MARK: CalculLogic
extension SliderCustomView {
    private func getWidthRectangle() -> CGFloat {
        var minPrice: Int
        var maxPrice: Int

        if viewModel.valueMin < viewModel.rangeMinPrice {
            minPrice =  viewModel.rangeMinPrice
        } else if viewModel.valueMin >= viewModel.rangeMaxPrice {
            minPrice = viewModel.rangeMinPrice
        } else {
            minPrice = viewModel.valueMin
        }


        if viewModel.valueMax >= viewModel.rangeMaxPrice {
            maxPrice = viewModel.rangeMaxPrice
        } else {
            maxPrice = viewModel.valueMax
        }

        return (getPosition(from: maxPrice) - getPosition(from: minPrice)) * totalSizeRectangle.width
    }

    private func getOffsetCircleMax() -> CGFloat {
        var maxPrice: Int
        if viewModel.valueMax >= viewModel.rangeMaxPrice {
            maxPrice = viewModel.rangeMaxPrice
        } else {
            maxPrice = viewModel.valueMax
        }
        return getPosition(from: maxPrice) * totalSizeRectangle.width - viewModel.paddingHorizontalRectangle
    }

    private func getOffsetCircleMin() -> CGFloat {
        var minPrice: Int

        if viewModel.valueMin < viewModel.rangeMinPrice {
            minPrice =  viewModel.rangeMinPrice
        } else if viewModel.valueMin >= viewModel.rangeMaxPrice {
            minPrice = viewModel.rangeMinPrice
        } else {
            minPrice = viewModel.valueMin
        }
        return getPosition(from: minPrice) * totalSizeRectangle.width - viewModel.paddingHorizontalRectangle + (widthCircle + widthCircle * 0.1)
    }


    private func getPrice(from value: CGFloat) -> Int {
        return Int(value * CGFloat(viewModel.rangeMaxPrice - viewModel.rangeMinPrice)) + viewModel.rangeMinPrice
    }

    private func getPosition(from price: Int) -> CGFloat {
        return CGFloat(price - viewModel.rangeMinPrice) / CGFloat(viewModel.rangeMaxPrice - viewModel.rangeMinPrice)
    }

    private func getPositionRectangleBlack() -> CGFloat {
        var minPrice: Int
        if viewModel.valueMin < viewModel.rangeMinPrice {
            minPrice =  viewModel.rangeMinPrice
        } else if viewModel.valueMin >= viewModel.rangeMaxPrice {
            minPrice = viewModel.rangeMinPrice
        } else {
            minPrice = viewModel.valueMin
        }
        return CGFloat(minPrice - viewModel.rangeMinPrice) / CGFloat(viewModel.rangeMaxPrice - viewModel.rangeMinPrice)
    }

    private func roundToStep(_ price: Int) -> Int {
        let step = viewModel.stepValue
        return (price / step) * step
    }
}
