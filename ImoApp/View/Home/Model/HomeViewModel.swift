//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

public struct HomeViewModel: Equatable, Hashable {
    let section: [SectionViewModel]

    struct SectionViewModel: Equatable, Hashable {
        let itemHouse: TypeCardHome
    }

    enum TitleSection: String, Hashable, CaseIterable {
        case paris = "Paris"
        case marseille = "Marseille"
        case lyon = "Lyon"
    }
}

extension HomeViewModel {
    static var sectionViewModel: [SectionViewModel] {
        let title = HomeViewModel.TitleSection.allCases
        var homeSection: [SectionViewModel] = []
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
                                               houseSurfaceArea: .random(in: 10...1000)))
        }

        for _ in 1...10 {
            let randomImage = Int.random(in: 1...8)
            itemHouseStacked.append(CardHomeViewModel(imageHouse: String(randomImage),
                                               titleHouse: "Title House",
                                               addressHouse: "Address House",
                                               numberRoom: .random(in: 0...10),
                                               price: .random(in: 50000.0...2000000.0),
                                               houseSurfaceArea: .random(in: 10...1000)))
        }

        for _ in 1...100 {
            let randomImage = Int.random(in: 1...8)
            itemHouseDefault.append(CardHomeViewModel(imageHouse: String(randomImage),
                                               titleHouse: "Title House",
                                               addressHouse: "Address House",
                                               numberRoom: .random(in: 0...10),
                                               price: .random(in: 50000.0...2000000.0),
                                               houseSurfaceArea: .random(in: 10...1000)))
        }


        for item in title {
            let section: SectionViewModel
            switch item {
            case .paris:
                section = SectionViewModel(itemHouse: .carousel(titleSection: item.rawValue,
                                                                itemHouseCarousel))
            case .marseille:
                section = SectionViewModel(itemHouse: .stacked(titleSection: item.rawValue,
                                                               itemHouseStacked))

            case .lyon:
                section = SectionViewModel(itemHouse: .default(titleSection: item.rawValue,
                                                               itemHouseDefault))
            }
            homeSection.append(section)
        }
        return homeSection
    }

    static var homeViewModelSample: HomeViewModel {
        return HomeViewModel(section: sectionViewModel)
    }
}
