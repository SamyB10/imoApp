//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import SwiftUI
final class FilterViewManager: ObservableObject {
    private let interacor: FilterBusinessLogic?
    @Published private(set) var viewModel: FilterHomeViewModel
    @Published var selectedPickerCell: UUID?

    init(interacor: FilterBusinessLogic?,
         viewModel: FilterHomeViewModel) {
        self.interacor = interacor
        self.viewModel = viewModel
    }

    func didLoad() {
        interacor?.didLoad()
    }
}

extension FilterViewManager: FilterDisplayLogic {
    func displayInterface(with homeViewModel: FilterHomeViewModel) {
        DispatchQueue.main.async {
            self.viewModel = homeViewModel
        }
    }
}
