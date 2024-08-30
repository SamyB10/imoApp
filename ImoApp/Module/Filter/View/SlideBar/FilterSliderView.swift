//
//  FilterSliderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterSliderView: View {
//    var cell: FilterViewModel.

    var body: some View {
//        ForEach(cells, id: \.self) { cell in
//            switch cell {
//            case .priceMin:
//                SliderView(viewModel: cell.viewModel)
//            case .priceMax:
                Text("")
//            }
//        }
    }
}


struct SliderView: View {
    @ObservedObject private(set) var viewModel: SliderViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Min: ")
                Spacer()
                Text("\(Int(viewModel.priceMin)) €")
            }
            Slider(value: $viewModel.priceMin,
                   in: 0...viewModel.priceMax,
                   step: 5000)
            .accentColor(.blue)
            HStack {
                Text("Max: ")
                Spacer()
                Text("\(Int(viewModel.priceMax)) €")
            }
            Slider(value: $viewModel.priceMax,
                   in: viewModel.priceMin...2000000,
                   step: 5000)
            .accentColor(.blue)
        }
        .padding()
    }
}


