//
//  HomeModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/09/2024.
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
        let id: UUID
        let imageHouse: String
        let titleHouse: String
        let addressHouse: String
        let numberRoom: Int
        let price: Double
        let houseSurfaceArea: Int
        let isFavorite: Bool
    }
    
    public enum TitleSection: String, Hashable, CaseIterable {
        case paris = "Paris"
        case lyon = "Lyon"
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
                title: .lyon,
                items: mockItemsForCity(city: "Lyon")
            )
        ]
    }

    private static func mockItemsForCity(city: String) -> [HomeViewModel.ItemHouse] {
        let numberOfItems = Int.random(in: 10...50)
        var items: [HomeViewModel.ItemHouse] = []


        for index in 1...numberOfItems {
            let randomImage = Int.random(in: 1...8)
            let item = HomeViewModel.ItemHouse(
                id: UUID(),
                imageHouse: randomImage.formatted(),
                titleHouse: "Maison \(index) à \(city)",
                addressHouse: "\(index) Rue de \(city), 00000 \(city)",
                numberRoom: Int.random(in: 1...8),
                price: Double.random(in: 500000...3000000),
                houseSurfaceArea: Int.random(in: 50...300),
                isFavorite: false
            )
            items.append(item)
        }

        return items
    }
}
