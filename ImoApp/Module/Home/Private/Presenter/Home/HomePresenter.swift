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
        
        
        
        //        return response.sections.forEach { section in
        //            switch section.title {
        //            case .paris:
        //                HomeViewModel.ViewModel(header: createHeaderViewModel(with: section.title),
        //                                        itemHouse: createItemViewModel(with: section))
        //            case .marseille:
        //                HomeViewModel.ViewModel(header: createHeaderViewModel(with: section.title),
        //                                        itemHouse: createItemViewModel(with: section))
        //
        //            case .lyon:
        //                HomeViewModel.ViewModel(header: createHeaderViewModel(with: section.title),
        //                                        itemHouse: createItemViewModel(with: section))
        //            }
        //        }
    }
    
    private func createHeaderViewModel(with response: HomeViewModel.TitleSection) -> HeaderViewModel {
        return HeaderViewModel(apperance: .home, title: response.rawValue)
    }
    
    private func createItemViewModel(with response: HomeViewModel.Section) -> HomeViewModel.ViewModel.TypeCardHome {
        switch response.title {
        case .paris:
                .carousel(titleSection: response.title.rawValue,
                          createCardHomeViewModel(with: response.items))
        case .marseille:
                .stacked(titleSection: response.title.rawValue,
                         createCardHomeViewModel(with: response.items))
        case .lyon:
                .default(titleSection: response.title.rawValue,
                         createCardHomeViewModel(with: response.items))
        }
    }
    
    private func createCardHomeViewModel(with response: [HomeViewModel.ItemHouse]) -> [HomeViewModel.ViewModel.CardHomeViewModel] {
        response.map {
            HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: $0.imageHouse,
                                                      titleHouse: $0.titleHouse,
                                                      addressHouse: $0.addressHouse,
                                                      numberRoom: $0.numberRoom,
                                                      price: $0.price,
                                                      houseSurfaceArea: $0.houseSurfaceArea)
        }
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface(with response: HomeViewModel.Response) {
        let sectionViewModel = mapResponse(with: response)
        viewModel = HomeViewModel.ViewModel(section: sectionViewModel)
    }
}
