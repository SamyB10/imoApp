//
//  FilterViewModelHeader.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation

extension FilterViewModel.Section {
    enum HeaderApperance: Hashable, Equatable  {
        case typeProperty
        case numberOfRoom
        case numberOfBedroom
        case price
        case areaSquareMeter
        case localisation
        case builYear
        case enery
    }

    var header: HeaderViewModel {
        switch self.headerApperance {
        case .typeProperty:
            HeaderViewModel(apperance: .filter,
                            title: "Type de Bien",
                            image: .systemName("house"))
        case .numberOfRoom:
            HeaderViewModel(apperance: .filter,
                            title: "Nombre de Pièces",
                            image: .systemName("door.left.hand.open"))
        case .price:
            HeaderViewModel(apperance: .filter,
                            title: "Prix du bien",
                            image: .systemName("eurosign.square"))
        case .areaSquareMeter:
            HeaderViewModel(apperance: .filter,
                            title: "Surface du bien",
                            image: .systemName("house"))
        case .localisation:
            HeaderViewModel(apperance: .filter,
                            title: "Localisation",
                            image: .systemName("mappin.and.ellipse"))
        case .numberOfBedroom:
            HeaderViewModel(apperance: .filter,
                            title: "Nombre de chambre",
                            image: .systemName("bed.double"))
        case .builYear:
            HeaderViewModel(apperance: .filter,
                            title: "Année de Construction",
                            image: .systemName("calendar"))
        case .enery:
            HeaderViewModel(apperance: .filter,
                            title: "Performance Enérgetique",
                            image: .systemName("globe.europe.africa"))
        }
    }

    var paddingTop: CGFloat {
        switch self.headerApperance {
        case .typeProperty,
                .numberOfRoom,
                .numberOfBedroom,
                .price,
                .areaSquareMeter,
                .localisation,
                .builYear,
                .enery:
            0
        }
    }
}
