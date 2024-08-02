//
//  HomePresenter.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//

import Foundation

public protocol HomePresentationLogic: AnyObject {
    func presentInterface()
}

final class HomePresenter {
    private var view: HomeDisplayLogic?

    func inject(view: HomeDisplayLogic?) {
        self.view = view
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentInterface() {
        DispatchQueue.main.async { [self] in
            print("present")
            view?.displayInterface()
        }
    }
}
