//
//  FilterInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation
protocol FilterBusinessLogic {
    func didLoad()
}

final class FilterInteractor {
    private var presenter: FilterPresentationLogic?

    func inject(presenter: FilterPresentationLogic?) {
        self.presenter = presenter
    }
}

extension FilterInteractor: FilterBusinessLogic {
    func didLoad() {
        presenter?.presentInterface(with: .filterHomeViewModelSample)
    }
}
