//
//  SliderViewLocalisation.swift
//  ImoApp
//
//  Created by Boussair Samy on 05/09/2024.
//

import SwiftUI
struct SliderLocalisation: View {
    private(set) var cell: FilterViewModel.Slider
    @ObservedObject var viewModel: SliderViewModel

    var body: some View {
        VStack(alignment: .trailing) {
            Slider(value: $viewModel.localisation,
                   in: 0...100,
                   step: 10)
            .accentColor(.black)
            HStack {
                Text(" 0 - \(viewModel.localisation.formatted(.number)) km")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .padding(viewModel.paddingText)
                    .overlay {
                        RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                            .stroke(Color.black,
                                    lineWidth: viewModel.lineWidth)
                    }
            }
        }
    }
}
