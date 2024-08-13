//
//  GabaritListViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//

import Foundation
struct GabaritListViewModel: Hashable, Equatable {
    let items: [ItemGabaritList]

    struct ItemGabaritList: Hashable, Equatable, Identifiable {
        let id: UUID
        let title: String

        init(id: UUID = UUID(),
             title: String) {
            self.id = id
            self.title = title
        }
    }
}

extension GabaritListViewModel {
    var numberItemDisplay: Int {
        if items.count > 2 {
            return 3
        } else {
            return items.count
        }
    }
}

extension GabaritListViewModel {
    static var viewModel: GabaritListViewModel {
        var items: [ItemGabaritList] = []
        for i in 1...12 {
            items.append(ItemGabaritList(id: UUID(),
                                         title: String(i)))
        }

        return GabaritListViewModel(items: items)
    }
}
