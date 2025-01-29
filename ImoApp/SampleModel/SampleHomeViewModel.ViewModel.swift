//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 26/09/2024.
//

import Foundation
extension HomeViewModel.ViewModel {
    static var sectionViewModel: [HomeViewModel.ViewModel.SectionViewModel] {
        let typeSection = HomeViewModel.TypeSection.allCases
        var homeSection: [HomeViewModel.ViewModel.SectionViewModel] = []
        var itemHouseCarousel: [CardHomeViewModel] = []
        var itemHouseStacked: [CardHomeViewModel] = []
        var itemHouseDefault: [CardHomeViewModel] = []

        for _ in 1...4 {
            let randomImage = Int.random(in: 1...8)
            itemHouseCarousel.append(CardHomeViewModel(imageHouse: String(randomImage),
                                                       titleHouse: "Title House",
                                                       addressHouse: "Address House",
                                                       numberRoom: .random(in: 0...10),
                                                       price: .random(in: 500000...1000000),
                                                       houseSurfaceArea: .random(in: 10...1000),
                                                       isFavorite: false))
        }

        for _ in 1...10 {
            let randomImage = Int.random(in: 1...8)
            itemHouseStacked.append(CardHomeViewModel(imageHouse: String(randomImage),
                                                      titleHouse: "Title House",
                                                      addressHouse: "Address House",
                                                      numberRoom: .random(in: 0...10),
                                                      price: .random(in: 500000...1000000),
                                                      houseSurfaceArea: .random(in: 10...1000),
                                                      isFavorite: false))
        }

        for _ in 1...100 {
            let randomImage = Int.random(in: 1...8)
            itemHouseDefault.append(CardHomeViewModel(imageHouse: String(randomImage),
                                                      titleHouse: "Title House",
                                                      addressHouse: "Address House",
                                                      numberRoom: .random(in: 0...10),
                                                      price: .random(in: 100000...1000000),
                                                      houseSurfaceArea: .random(in: 10...1000),
                                                      isFavorite: false))
        }


        for item in typeSection {
            let section: HomeViewModel.ViewModel.SectionViewModel
            let header: HeaderViewModel
            switch item {
            case .carousel:
                header = HeaderViewModel(apperance: .home,
                                         title: "Paris")
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .carousel(itemHouseCarousel))
            case .default:
                header = HeaderViewModel(apperance: .home,
                                         title: "Lyon")
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .default(itemHouseDefault))
            }
            homeSection.append(section)
        }
        return homeSection
    }

    static var homeViewModelSample: HomeViewModel.ViewModel {
        return HomeViewModel.ViewModel(section: sectionViewModel)
    }
}
