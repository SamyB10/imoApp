//
//  SampleCardViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 26/09/2024.
//

import Foundation
extension HomeViewModel.ViewModel.CardHomeViewModel {
    static var viewModelTest = HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: "coucher_soleil",
                                                                         titleHouse: "Title House",
                                                                         addressHouse: "Address House",
                                                                         numberRoom: 4,
                                                                         price: 250000,
                                                                         houseSurfaceArea: 100,
                                                                         isFavorite: false)

    static var viewModelSample: [HomeViewModel.ViewModel.CardHomeViewModel] {
        var cardHome: [HomeViewModel.ViewModel.CardHomeViewModel] = []
        for _ in 1...10 {
            let random = Int.random(in: 1...4)
            let card = HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: "\(random)",
                                                                 titleHouse: "Title House",
                                                                 addressHouse: "Address House",
                                                                 numberRoom: 4,
                                                                 price: 250000,
                                                                 houseSurfaceArea: 100,
                                                                 isFavorite: false)

            cardHome.append(card)
        }
        return cardHome
    }
}

