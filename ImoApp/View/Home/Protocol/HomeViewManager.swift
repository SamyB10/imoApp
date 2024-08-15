//
//  HomeViewMannager.swift
//  ImoApp
//
//  Created by Boussair Samy on 15/08/2024.
//

import Foundation
import SwiftUI

final class HomeViewManager: ObservableObject {
    private let interacor: HomeBusinessLogic?

    @Published var viewModel: HomeViewModel
    @Published var gabaritListViewModel: GabaritListViewModel

    init(interacor: HomeBusinessLogic,
         viewModel: HomeViewModel,
         gabaritListViewModel: GabaritListViewModel) {
        self.interacor = interacor
        self.viewModel = viewModel
        self.gabaritListViewModel = gabaritListViewModel
    }

    func didLoad() {
        interacor?.didLoad()
    }
}

extension HomeViewManager: HomeDisplayLogic {
    func displayInterface(with viewModel: GabaritListViewModel) {
        DispatchQueue.main.async {

                // Reassignment explicit to trigger UI update
                self.gabaritListViewModel = viewModel
            
        }
    }
}
