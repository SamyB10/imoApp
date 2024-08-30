//
//  FilterHomeContext.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/08/2024.
//

import Foundation
struct FilterHomeContext: Equatable {
    private(set) var currentFilter: FilterContent?

    mutating func didReceive(content: FilterContent) {
        self.currentFilter = content
    }

    mutating func didReceive(item: SelectedFilterItem) {
//        guard let currentFilter else { return }
        switch item {
        case .appartment:
            self.currentFilter?.property = FilterContent.Property(type: .appartment)
        case .house:
            self.currentFilter?.property = FilterContent.Property(type: .house)
        case .both:
            self.currentFilter?.property = FilterContent.Property(type: .both)
        case let .studio(value):
            self.currentFilter?.studio = value
        case let .one(value):
            self.currentFilter?.oneRoom = value
        case let .two(value):
            self.currentFilter?.twoRoom = value
        case let .three(value):
            self.currentFilter?.threeRoom = value
        case let .four(value):
            self.currentFilter?.fourRoom = value
        case let .fiveOrMore(value):
            self.currentFilter?.fiveOrMoreRoom = value
        }
    }

    private var sections: [FilterViewModel.Section] {
        guard let currentFilter else { return [] }
        let typeProperty = FilterViewModel.Section.typeProperty([
            .appartment(currentFilter.property.type == .appartment),
            .house(currentFilter.property.type == .house),
            .both(currentFilter.property.type == .both)
        ])

        let numberOfRoom = FilterViewModel.Section.numberOfRoom([
            .studio(currentFilter.studio),
            .one(currentFilter.oneRoom),
            .two(currentFilter.twoRoom),
            .three(currentFilter.threeRoom),
            .four(currentFilter.fourRoom),
            .fiveOrMore(currentFilter.fiveOrMoreRoom)
        ])
        
        return [
            typeProperty,
            numberOfRoom
        ]
    }

    var viewModel: FilterViewModel {
        FilterViewModel(sections: sections)
    }
}

