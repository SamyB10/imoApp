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
    @Published var searchLocationViewModel: SearchLocationViewModel
    @Published private(set) var viewModel: HomeViewModel
    
    init(interacor: HomeBusinessLogic,
         searchLocationViewModel: SearchLocationViewModel,
         viewModel: HomeViewModel) {
        self.interacor = interacor
        self.searchLocationViewModel = searchLocationViewModel
        self.viewModel = viewModel
    }
    
    func didLoad() {
        interacor?.didLoad()
    }
}

extension HomeViewManager: HomeDisplayLogic {
    func displayInterface(with homeViewModel: HomeViewModel) {
        DispatchQueue.main.async {
            self.viewModel = homeViewModel
        }
    }
}
