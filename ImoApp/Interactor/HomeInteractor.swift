//
//  HomeInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

protocol HomeBusinessLogic {
    func didLoad()
}

final class HomeInteractor {
    private var presenter: HomePresentationLogic?
    private var service: HomeService

    init(service: HomeService) {
        self.service = service
    }

    func inject(presenter: HomePresentationLogic?) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func didLoad() {
        Task {
            let response = await service.mockTest()
            presenter?.presentInterface(with: response)
        }
//        Task {
//            switch await service.fetchRegions() {
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
