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
        case .localisation:
            SliderLocalisation(cell: cell,
                               viewModel: cell.sliderViewModel)
        case .price:
            SliderCustomView(cell: cell,
                             viewModel: cell.sliderViewModel) { 
                action($0)
            }
        case .areaSquareMeter:
            SliderCustomView(cell: cell,
                             viewModel: cell.sliderViewModel) {
                action($0)
            }
        }
    }
}
