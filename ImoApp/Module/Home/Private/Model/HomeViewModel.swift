//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation
extension HomeViewModel {
    struct ViewModel: Equatable, Hashable {
        let section: [SectionViewModel]

        struct SectionViewModel: Equatable, Hashable {
            let header: HeaderViewModel
            let itemHouse: TypeCardHome
        }
    }
}

extension HomeViewModel.ViewModel {
    static var sectionViewModel: [HomeViewModel.ViewModel.SectionViewModel] {
        let title = HomeViewModel.TitleSection.allCases
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
                                                       price: .random(in: 50000.0...2000000.0),
                                                       houseSurfaceArea: .random(in: 10...1000),
                                                       isFavorite: false))
        }

        for _ in 1...10 {
            let randomImage = Int.random(in: 1...8)
            itemHouseStacked.append(CardHomeViewModel(imageHouse: String(randomImage),
                                                      titleHouse: "Title House",
                                                      addressHouse: "Address House",
                                                      numberRoom: .random(in: 0...10),
                                                      price: .random(in: 50000.0...2000000.0),
                                                      houseSurfaceArea: .random(in: 10...1000),
                                                      isFavorite: false))
        }

        for _ in 1...100 {
            let randomImage = Int.random(in: 1...8)
            itemHouseDefault.append(CardHomeViewModel(imageHouse: String(randomImage),
                                                      titleHouse: "Title House",
                                                      addressHouse: "Address House",
                                                      numberRoom: .random(in: 0...10),
                                                      price: .random(in: 50000.0...2000000.0),
                                                      houseSurfaceArea: .random(in: 10...1000),
                                                      isFavorite: false))
        }


        for item in title {
            let section: HomeViewModel.ViewModel.SectionViewModel
            let header: HeaderViewModel
            switch item {
            case .paris:
                header = HeaderViewModel(apperance: .home,
                                         title: item.rawValue)
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .carousel(titleSection: item.rawValue,
                                                                                        itemHouseCarousel))
            case .lyon:
                header = HeaderViewModel(apperance: .home,
                                         title: item.rawValue)
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .default(titleSection: item.rawValue,
                                                                                       itemHouseDefault))
            }
            homeSection.append(section)
        }
        return homeSection
    }

    static var homeViewModelSample: HomeViewModel.ViewModel {
        return HomeViewModel.ViewModel(section: sectionViewModel)
    }
}
