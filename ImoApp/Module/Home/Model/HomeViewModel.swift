//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

public enum HomeViewModel {
    public struct Response {
        let sections: [Section]
    }

    public struct Section {
        let title: TitleSection
        let items: [ItemHouse]
    }

    public struct ItemHouse {
        let imageHouse: String
        let titleHouse: String
        let addressHouse: String
        let numberRoom: Int
        let price: Double
        let houseSurfaceArea: Int
    }

    public enum TitleSection: String, Hashable, CaseIterable {
        case paris = "Paris"
        case marseille = "Marseille"
        case lyon = "Lyon"
    }

    struct ViewModel: Equatable, Hashable {
        let section: [SectionViewModel]

        struct SectionViewModel: Equatable, Hashable {
            let header: HeaderViewModel
            let itemHouse: TypeCardHome
        }
    }
}

extension HomeViewModel.Response {

    public static func mockResponse() -> HomeViewModel.Response {
        return HomeViewModel.Response(sections: mockSections())
    }

    private static func mockSections() -> [HomeViewModel.Section] {
        return [
            HomeViewModel.Section(
                title: .paris,
                items: mockItemsForCity(city: "Paris")
            ),
            HomeViewModel.Section(
                title: .marseille,
                items: mockItemsForCity(city: "Marseille")
            ),
            HomeViewModel.Section(
                title: .lyon,
                items: mockItemsForCity(city: "Lyon")
            )
        ]
    }

    private static func mockItemsForCity(city: String) -> [HomeViewModel.ItemHouse] {
        let numberOfItems = Int.random(in: 10...50) // Nombre aléatoire entre 10 et 50
        var items: [HomeViewModel.ItemHouse] = []


        for index in 1...numberOfItems {
            let randomImage = Int.random(in: 1...8)
            let item = HomeViewModel.ItemHouse(
                imageHouse: randomImage.formatted(),
                titleHouse: "Maison \(index) à \(city)",
                addressHouse: "\(index) Rue de \(city), 00000 \(city)",
                numberRoom: Int.random(in: 1...8), // Nombre de pièces aléatoire
                price: Double.random(in: 500000...3000000), // Prix aléatoire entre 500K et 3M
                houseSurfaceArea: Int.random(in: 50...300) // Surface aléatoire entre 50 et 300 m²
            )
            items.append(item)
        }

        return items
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
            let section: HomeViewModel.ViewModel.SectionViewModel
            let header: HeaderViewModel
            switch item {
            case .paris:
                header = HeaderViewModel(apperance: .home,
                                         title: item.rawValue)
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .carousel(titleSection: item.rawValue,
                                                                                        itemHouseCarousel))
            case .marseille:
                header = HeaderViewModel(apperance: .home,
                                         title: item.rawValue)
                section = HomeViewModel.ViewModel.SectionViewModel(header: header,
                                                                   itemHouse: .stacked(titleSection: item.rawValue,
                                                                                       itemHouseStacked))

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
