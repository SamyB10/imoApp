//
//  HomePresenter.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

public protocol HomePresentationLogic: AnyObject {
    func presentInterface(with response: HomeViewModel.Response)
}

final class HomePresenter {
    private weak var display: HomeDisplayLogic?
    private var viewModel: HomeViewModel.ViewModel? {
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
    
    private func mapResponse(with response: HomeViewModel.Response) -> [HomeViewModel.ViewModel.SectionViewModel] {
        response.sections.map {
            return HomeViewModel.ViewModel.SectionViewModel(header: createHeaderViewModel(with: $0.title),
                                                            itemHouse: createItemViewModel(with: $0))
        }
    }
    
    private func createHeaderViewModel(with response: String) -> HeaderViewModel {
        return HeaderViewModel(apperance: .home, title: response)
    }
    
    private func createItemViewModel(with response: HomeViewModel.Section) -> HomeViewModel.ViewModel.TypeCardHome {
        switch response.type {
        case .carousel:
                .carousel(createCardHomeViewModel(with: response.items))
        case .default:
                .default(createCardHomeViewModel(with: response.items))
        }
    }
    
    private func createCardHomeViewModel(with response: [HomeViewModel.ItemHouse]) -> [HomeViewModel.ViewModel.CardHomeViewModel] {
        response.map {
            HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: $0.imageHouse,
                                                      titleHouse: $0.titleHouse,
                                                      addressHouse: $0.addressHouse,
                                                      numberRoom: $0.numberRoom,
                                                      price: $0.price,
                                                      houseSurfaceArea: $0.houseSurfaceArea,
                                                      isFavorite: $0.isFavorite)
        }
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface(with response: HomeViewModel.Response) {
        let sectionViewModel = mapResponse(with: response)
        viewModel = HomeViewModel.ViewModel(section: sectionViewModel)
    }
}
