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
        guard let currentFilter else { return }
        switch item {
        case .appartment:
            self.currentFilter?.property = FilterContent.Property(type: .appartment)
        case .house:
            self.currentFilter?.property = FilterContent.Property(type: .house)
        case .both:
            self.currentFilter?.property = FilterContent.Property(type: .both)
        default:
            break
        }
    }

    var viewModel: FilterViewModel {
        let sections = currentFilter?.filterSection() ?? []
        return FilterViewModel(sections: sections)
    }
}

