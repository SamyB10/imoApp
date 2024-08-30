//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import SwiftUI
final class FilterViewManager: ObservableObject {
    private let interacor: FilterBusinessLogic?
    @Published private(set) var viewModel: FilterViewModel? {
        didSet {
            guard self.viewModel != oldValue else { return }
        }
    }

    init(interacor: FilterBusinessLogic?) {
        self.interacor = interacor
    }

    func didLoad() {
        interacor?.didLoad()
    }

    func didSelectItem(with item: SelectedFilterItem) {
        interacor?.didSelectItem(with: item)
    }
}

extension FilterViewManager: FilterDisplayLogic {
    func displayInterface(with viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }

    func updatePicker(with value: Bool) {}
}
