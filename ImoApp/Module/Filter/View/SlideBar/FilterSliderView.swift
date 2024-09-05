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
        case .minPrice,
                .maxPrice:
            SliderViewPrice(cell: cell, viewModel: cell.sliderViewModel) {
                action($0)
            }
        case .localisation:
            SliderLocalisation(cell: cell,
                               viewModel: cell.sliderViewModel)
        }
    }
}
