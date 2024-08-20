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

//    private func mockGabaritList(with action: TypeActionGabaritList) {
//        Task {
//            switch action {
//            case .region(let index):
//                guard let key = itemGabaritListRegions?[index].key else { return }
//                let result = await service.mockDepartments(with: key)
//                itemGabaritListDepartments = result
//                presenter?.updateGabaritList(with: .department(result))
//            case .department(let index):
//                guard let key = itemGabaritListDepartments?[index].key else { return }
//                let result = await service.mockCity(with: key)
//                itemGabaritListCitys = result
//                presenter?.updateGabaritList(with: .city(result))
//            case .city(let index):
//                print(itemGabaritListCitys?[index])
//            case .clean:
//                didLoad()
//            }
//        }
//    }
}

extension HomeInteractor: HomeBusinessLogic {

    func didLoad() {
        presenter?.presentInterface(with: .homeViewModelSample)
    }
}
