//
//  HomeInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation


enum TypeActionGabaritList {
    case region(Int)
    case department(Int)
    case city(Int)
    case clean
}

protocol HomeBusinessLogic {
    func didLoad()
    func didSelectGabaritList(with action: TypeActionGabaritList)
}

final class HomeInteractor {
    private var presenter: HomePresentationLogic?
    private var service: HomeService

    private var itemGabaritListDepartments: [RestModelDepartment]?
    private var itemGabaritListCitys: [RestModelCity]?
    private var itemGabaritListRegions: [RestModelRegions]? {
        didSet {
            guard let itemGabaritListRegions, itemGabaritListRegions != oldValue else { return }
        }
    }

    init(service: HomeService) {
        self.service = service
    }

    func inject(presenter: HomePresentationLogic?) {
        self.presenter = presenter
    }

    private func mockGabaritList(with action: TypeActionGabaritList) {
        Task {
            switch action {
            case .region(let index):
                guard let key = itemGabaritListRegions?[index].key else { return }
                let result = await service.mockDepartments(with: key)
                itemGabaritListDepartments = result
                presenter?.updateGabaritList(with: .department(result))
            case .department(let index):
                guard let key = itemGabaritListDepartments?[index].key else { return }
                let result = await service.mockCity(with: key)
                itemGabaritListCitys = result
                presenter?.updateGabaritList(with: .city(result))
            case .city(let index):
                print(itemGabaritListCitys?[index])
            case .clean:
                didLoad()
            }
        }
    }
}

extension HomeInteractor: HomeBusinessLogic {

    func didLoad() {
        Task {
            let response = await service.mockRegions()
            itemGabaritListRegions = response
            presenter?.presentInterface(with: response)

            //            Task {
            //                switch await service.fetchRegions() {
            //                case .success(let result):
            //                    itemGabaritListRegions = result
            //                    presenter?.presentInterface(with: result)
            //                case .failure(let error):
            //                    print(error)
            //                }
        }
    }

    func didSelectGabaritList(with action: TypeActionGabaritList) {
        mockGabaritList(with: action)
//        Task {
//            switch action {
//            case .region(let index):
//                guard let key = itemGabaritListRegions?[index].key else { return }
//                switch await service.fetchDepartments(with: key) {
//                case .success(let result):
//                    itemGabaritListDepartments = result
//                    presenter?.updateGabaritList(with: .department(result))
//                case .failure(let error):
//                    print(error)
//                }
//            case .department(let index):
//                guard let key = itemGabaritListDepartments?[index].key else { return }
//                switch await service.fetchCity(with: key) {
//                case .success(let result):
//                    itemGabaritListCitys = result
//                    presenter?.updateGabaritList(with: .city(result))
//                case .failure(let error):
//                    print(error)
//                }
//            case .city(let index):
//                print(itemGabaritListCitys?[index])
//            }
//        }
    }
}
