//
//  HomePresenter.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

public protocol HomePresentationLogic: AnyObject {
    func presentInterface(with response: [RestModelRegions])
}

final class HomePresenter {
    private var display: HomeDisplayLogic?
    private var viewModel: GabaritListViewModel? {
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

    private func mapResponseRegions(with response: [RestModelRegions]) -> GabaritListViewModel {
        let items = response.compactMap {
            mapItems(with: $0)
        }
        return GabaritListViewModel(items: items)
    }

    private func mapItems(with response: RestModelRegions) -> GabaritListViewModel.ItemGabaritList? {
        guard let key = response.key,
              let nameRegion = response.name else { return nil }
        return GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
                                                    type: .regions(key, nameRegion))
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface(with response: [RestModelRegions]) {
        viewModel = mapResponseRegions(with: response)
    }
}
