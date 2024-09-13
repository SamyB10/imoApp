//
//  CarouselHeaderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 02/08/2024.
//

import SwiftUI

struct SectionHeaderView: View {
    private let viewModel: HeaderViewModel
    
    init(viewModel: HeaderViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if let image = viewModel.image {
                ImageLoaderView(dvImage: image, contentMode: .fit)
                    .frame(width: 20, height: 20)
            }

            Text(viewModel.title)
//                .font(viewModel.font)
                .fontWeight(viewModel.fontWeight)
        }
    }
}


struct HeaderViewModel: Equatable, Hashable {
    let apperance: Apperance
    let title: String
    let image: DVImage?

    init(apperance: Apperance,
         title: String,
         image: DVImage? = nil) {
        self.apperance = apperance
        self.title = title
        self.image = image
    }

    enum Apperance {
        case home
        case filter
    }
}

extension HeaderViewModel {
    var font: Font {
        switch apperance {
        case .home:
                .title
        case .filter:
                .title3
        }
    }

    var fontWeight: Font.Weight {
        switch apperance {
        case .home:
                .bold
        case .filter:
                .medium
        }
    }
}
