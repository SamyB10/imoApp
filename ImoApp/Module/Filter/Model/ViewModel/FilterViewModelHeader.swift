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
        case areaSquareMeterField
        case localisation
        case builYear
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
                            image: .systemName("eurosign.circle"))
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
                            title: "Année de Construction")
        case .areaSquareMeterField:
            HeaderViewModel(apperance: .filter,
                            title: "Surface du Terrain",
                            image: .systemName("house"))
        }
    }

    var paddingTop: CGFloat {
        switch self.headerApperance {
        case .typeProperty,
                .numberOfRoom,
                .numberOfBedroom,
                .price,
                .areaSquareMeter,
                .areaSquareMeterField,
                .localisation,
                .builYear:
            0
        }
    }
}
