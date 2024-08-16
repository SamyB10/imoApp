//
//  HomePresenter.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

public enum TypeRestModelGabaritList {
    case region([RestModelRegions])
    case department([RestModelDepartment])
    case city([RestModelCity])
}

public protocol HomePresentationLogic: AnyObject {
    func presentInterface(with response: [RestModelRegions])
    func updateGabaritList(with response: TypeRestModelGabaritList)
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
        return GabaritListViewModel(titleSection: "Regions",
                                    items: items)
    }
    
    private func mapResponseDepartment(with response: [RestModelDepartment]) -> GabaritListViewModel {
        let items = response.compactMap {
            mapItemsDepartment(with: $0)
        }
        return GabaritListViewModel(titleSection: "Department",
                                    items: items)
    }

    private func mapResponseCity(with response: [RestModelCity]) -> GabaritListViewModel {
        let items = response.compactMap {
            mapItemsCity(with: $0)
        }
        return GabaritListViewModel(titleSection: "City",
                                    items: items)
    }

    private func mapItems(with response: RestModelRegions) -> GabaritListViewModel.ItemGabaritList? {
        guard let key = response.key,
              let nameRegion = response.name else { return nil }
        return GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
                                                    type: .regions(key, nameRegion))
    }

    private func mapItemsDepartment(with response: RestModelDepartment) -> GabaritListViewModel.ItemGabaritList? {
        guard let key = response.key,
              let nameDepartment = response.name,
              let keyRegion = response.keyRegion else { return nil }
        return GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
                                                    type: .department(key, nameDepartment),
                                                    keyRegion: keyRegion)
    }

    private func mapItemsCity(with response: RestModelCity) -> GabaritListViewModel.ItemGabaritList? {
        guard let key = response.key,
              let nameCity = response.name,
              let keyRegion = response.keyRegion,
              let keyDepartment = response.keyDepartment,
              let postalCode = response.postalCode?.first else { return nil }
        return GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
                                                    type: .city(key, nameCity),
                                                    keyRegion: keyRegion,
                                                    postalCode: postalCode)
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface(with response: [RestModelRegions]) {
        viewModel = mapResponseRegions(with: response)
    }

    func updateGabaritList(with response: TypeRestModelGabaritList) {
        switch response {
        case .region(let items):
            viewModel = mapResponseRegions(with: items)
        case .department(let items):
            viewModel = mapResponseDepartment(with: items)
        case .city(let items):
            viewModel = mapResponseCity(with: items)
        }
    }
}
