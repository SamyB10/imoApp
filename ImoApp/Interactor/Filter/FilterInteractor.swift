//
//  FilterInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation
protocol FilterBusinessLogic {
    func didLoad()
    func didSelectItemPicker(with item: SelectedFilterItem)
}

final class FilterInteractor {
    private var presenter: FilterPresentationLogic?
    private let userFilter = UserFilter()

    func inject(presenter: FilterPresentationLogic?) {
        self.presenter = presenter
    }
}

extension FilterInteractor: FilterBusinessLogic {
    func didLoad() {
        presenter?.presentInterface(with: FilterContent(property: FilterContent.Property(type: userFilter.getProperty())))
    }

    func didSelectItemPicker(with item: SelectedFilterItem) {
        switch item {
        case .appartment:
            userFilter.saveValue(key: .selectedPropertyType, filter: .appartment)
        case .house:
            userFilter.saveValue(key: .selectedPropertyType, filter: .house)
        case .both:
            userFilter.saveValue(key: .selectedPropertyType, filter: .both)
        }
        presenter?.updateItem(with: item)
    }
}
