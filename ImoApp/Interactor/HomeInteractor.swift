//
//  HomeInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

protocol HomeBusinessLogic {
    func start()
}

final class HomeInteractor {
    private var presenter: HomePresentationLogic?

    func inject(presenter: HomePresentationLogic?) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func start() {
        presenter?.presentInterface()
        print("Start")
    }
}
