//
//  SliderViewPrice.swift
//  ImoApp
//
//  Created by Boussair Samy on 05/09/2024.
//

import SwiftUI
struct SliderViewPrice: View {
    private(set) var cell: FilterViewModel.Slider
    @ObservedObject private(set) var viewModel: SliderViewModel
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .padding(.top, 10)
            Slider(value: viewModel.appearance == .minPrice ? $viewModel.priceMin : $viewModel.priceMax,
                   in: viewModel.range,
                   step: viewModel.step)
            .accentColor(.black)
            HStack {
                Spacer()
                TextFieldView(viewModel: cell.textFieldViewModel) {
                    action(cell.selectedItem(with: $0))
                }
            }
        }

        .onChange(of: viewModel.priceOnChange) { oldValue, newValue in
            switch viewModel.appearance {
            case .minPrice:
                if newValue == viewModel.priceMax {
                    action(cell.selectedItem(with: newValue - viewModel.step))
                } else {
                    action(cell.selectedItem(with: newValue))
                }
            case .maxPrice:
                if newValue == viewModel.priceMin {
                    action(cell.selectedItem(with: newValue + viewModel.step))
                } else {
                    action(cell.selectedItem(with: newValue))
                }
            case .localisation:
                break
            }
        }
    }
}
