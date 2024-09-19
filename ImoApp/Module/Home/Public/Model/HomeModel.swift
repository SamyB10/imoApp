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
