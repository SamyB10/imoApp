//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation
public protocol FilterPresentationLogic: AnyObject {
    func presentInterface(with content: FilterContent)
    func updateItem(with selectedFilterItem: SelectedFilterItem)
}

final class FilterPresenter {
    private weak var display: FilterDisplayLogic?

    private var context: FilterHomeContext {
        didSet {
            presentInterface()
        }
    }

    init() {
        self.context = FilterHomeContext()
    }

    func inject(display: FilterDisplayLogic?) {
        self.display = display
    }

    func presentInterface() {
        let viewModel = context.viewModel
        DispatchQueue.main.async { [self] in
//            Task { @MainActor in
                self.display?.displayInterface(with: viewModel)
//            }
        }
    }
}

extension FilterPresenter: FilterPresentationLogic {
    func presentInterface(with content: FilterContent) {
        context.didReceive(content: content)
    }

    func updateItem(with selectedFilterItem: SelectedFilterItem) {
        context.didReceive(item: selectedFilterItem)
    }
}
