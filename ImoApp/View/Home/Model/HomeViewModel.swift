//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

struct HomeViewModel: Equatable, Hashable {
    let section: [SectionViewModel]

    struct SectionViewModel: Equatable, Hashable {
        let titleSection: TypeSection
        let itemHouse: [CardHomeViewModel]

        enum TypeSection: String, Hashable, CaseIterable {
            case paris = "Paris"
            case marseille = "Marseille"
            case lyon = "Lyon"
            case toulouse = "Toulouse"
            case nice = "Nice"
            case nantes = "Nantes"
            case montpellier = "Montpellier"
            case strasbourg = "Strasbourg"
        }
    }
}

extension HomeViewModel.SectionViewModel {
    var horizontalMarginScrollView: CGFloat {
#if os(macOS)
        40.0
#else
        20.0
#endif
    }
}

extension HomeViewModel {
    static var viewModelSample: HomeViewModel {
        let title = SectionViewModel.TypeSection.allCases
        var homeSection: [SectionViewModel] = []
        var itemHouse: [CardHomeViewModel] = []

        for _ in 1...4 {
            let randomImage = Int.random(in: 1...4)
            itemHouse.append(CardHomeViewModel(imageHouse: String(randomImage),
                                               titleHouse: "Title House",
                                               addressHouse: "Address House",
                                               numberRoom: .random(in: 0...10),
                                               price: .random(in: 50000.0...2000000.0),
                                               houseSurfaceArea: .random(in: 10...1000)))
        }

        for item in title {
            let section = SectionViewModel(titleSection: item,
                                           itemHouse: itemHouse)
            homeSection.append(section)
        }
        
        return HomeViewModel(section: homeSection)
    }
}
