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
    private let service: HomeService

    init(service: HomeService) {
        self.service = service
    }

    func inject(presenter: HomePresentationLogic?) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeBusinessLogic {

    func didLoad() {
        presenter?.presentInterface(with: .homeViewModelSample)
    }
}
