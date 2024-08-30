//
//  ListItemDetailHouseViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 07/08/2024.
//

import Foundation

enum ItemDetail: Hashable {
    case surface(String)
    case numberOfbathRoom(String)
    case numberOfRoom(String)
}

struct ItemDetailHouse: Hashable {
    let surface: String
    let numberOfbathRoom: String
    let numberOfRoom: String
}

extension ItemDetailHouse {
    static var itemViewModelTest: [ItemDetail] {
        [
            ItemDetail.numberOfRoom("4"),
            ItemDetail.numberOfbathRoom("2"),
            ItemDetail.surface("100")
        ]
    }
}
