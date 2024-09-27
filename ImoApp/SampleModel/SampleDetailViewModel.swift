//
//  SampleDetailViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 26/09/2024.
//

import Foundation
extension DetailPageViewModel {
    static var sampleViewModel: DetailPageViewModel {
        DetailPageViewModel(image: "coucher_soleil",
                            title: "Title",
                            ownerName: "Samy",
                            price: 200000)
    }
}
