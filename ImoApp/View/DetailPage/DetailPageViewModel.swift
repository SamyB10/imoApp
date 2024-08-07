//
//  DetailPageViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//

import Foundation
struct DetailPageViewModel {
    let image: String
    let title: String
    let ownerName: String
    let price: Int
}

extension DetailPageViewModel {
    static var sampleViewModel: DetailPageViewModel {
        DetailPageViewModel(image: "coucher_soleil",
                            title: "Title",
                            ownerName: "Samy",
                            price: 200000)
    }
}
