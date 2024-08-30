//
//  FilterViewModelHeader.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation

extension FilterViewModel.Section {
    var header: HeaderViewModel {
        switch self {
        case .typeProperty:
            HeaderViewModel(apperance: .filter,
                            title: "Type de Bien")
        case .numberOfRoom:
            HeaderViewModel(apperance: .filter,
                            title: "Nombre de Pièces",
                            image: .systemName("door.left.hand.open"))
        case .price:
            HeaderViewModel(apperance: .filter,
                            title: "Prix du bien")
        case .areaSquareMeter:
            HeaderViewModel(apperance: .filter,
                            title: "Surface du bien")
        case .localisation:
            HeaderViewModel(apperance: .filter,
                            title: "Localisation")
        }
    }
}
