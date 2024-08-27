//
//  HomePresenter.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

public protocol HomePresentationLogic: AnyObject {
    func presentInterface(with response: HomeViewModel)
}

final class HomePresenter {
    private weak var display: HomeDisplayLogic?
    private var viewModel: HomeViewModel? {
        didSet {
            guard let viewModel, viewModel != oldValue else { return }

            DispatchQueue.main.async { [self] in
                display?.displayInterface(with: viewModel)
            }
        }
    }

    func inject(display: HomeDisplayLogic?) {
        self.display = display
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface(with response: HomeViewModel) {
        viewModel = HomeViewModel(section: response.section)
    }
}
