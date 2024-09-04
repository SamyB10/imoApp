//
//  FilterSliderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterSliderView: View {
    var cell: FilterViewModel.Slider
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        switch cell {
        case .minPrice:
            SliderView(cell: cell, viewModel: cell.sliderViewModel) {
                action($0)
            }
        case .maxPrice:
            SliderViewMax(cell: cell,
                          viewModel: cell.sliderViewModel) {
                action($0)
            }
        }
    }
}

struct SliderView: View {
    private(set) var cell: FilterViewModel.Slider
    @ObservedObject var viewModel: SliderViewModel
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        VStack {
            Slider(value: $viewModel.priceMin,
                   in: 0...viewModel.priceMax,
                   step: viewModel.step)
            .accentColor(.black)
            HStack {
                Text("\(viewModel.priceMin.formatted(.number)) €")
                    .font(viewModel.fontSize)
                    .padding(viewModel.paddingText)
                    .overlay {
                        RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                            .stroke(Color.black,
                                    lineWidth: viewModel.lineWidth)
                    }
                Spacer()
            }
            .padding(.bottom)
        }
        .onChange(of: viewModel.priceMin) { oldValue, newValue in
            if newValue == viewModel.priceMax {
                action(cell.selectedItem(with: newValue - viewModel.step))
            } else {
                action(cell.selectedItem(with: newValue))
            }
        }
    }
}

struct SliderViewMax: View {
    private(set) var cell: FilterViewModel.Slider
    @ObservedObject private(set) var viewModel: SliderViewModel
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        VStack {
            Slider(value: $viewModel.priceMax,
                   in: viewModel.priceMin...(viewModel.maxRange ?? 10000.0),
                   step: viewModel.step)
            .accentColor(.black)
            HStack {
                Spacer()
                Text("\(viewModel.priceMax.formatted(.number)) €")
                    .font(viewModel.fontSize)
                    .padding(viewModel.paddingText)
                    .overlay {
                        RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                            .stroke(Color.black,
                                    lineWidth: viewModel.lineWidth)
                    }
            }
            .padding(.bottom)
        }
        .onChange(of: viewModel.priceMax) { oldValue, newValue in
            if newValue == viewModel.priceMin {
                action(cell.selectedItem(with: newValue + viewModel.step))
            } else {
                action(cell.selectedItem(with: newValue))
            }
        }
    }
}
