//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation
public protocol FilterPresentationLogic: AnyObject {
    func presentInterface(with response: FilterHomeViewModel)
}

final class FilterPresenter {
    private var display: FilterDisplayLogic?
    private var viewModel: FilterHomeViewModel? {
        didSet {
            guard let viewModel, viewModel != oldValue else { return }

            DispatchQueue.main.async { [self] in
                display?.displayInterface(with: viewModel)
            }
        }
    }

    func inject(display: FilterDisplayLogic?) {
        self.display = display
    }
}

extension FilterPresenter: FilterPresentationLogic {
    func presentInterface(with response: FilterHomeViewModel) {
        viewModel = response
    }
}
