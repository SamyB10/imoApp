//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import SwiftUI
final class FilterViewManager: ObservableObject {
    @Published private(set) var viewModel: FilterHomeViewModel

    init(viewModel: FilterHomeViewModel) {
        self.viewModel = viewModel
    }

//    private let interacor: HomeBusinessLogic?
//    @Published var searchLocationViewModel: SearchLocationViewModel
//    @Published private(set) var viewModel: HomeViewModel
//
//    init(interacor: HomeBusinessLogic,
//         searchLocationViewModel: SearchLocationViewModel,
//         viewModel: HomeViewModel) {
//        self.interacor = interacor
//        self.searchLocationViewModel = searchLocationViewModel
//        self.viewModel = viewModel
//    }
//
//    func didLoad() {
//        interacor?.didLoad()
//    }
//}
//
//extension HomeViewManager: HomeDisplayLogic {
//    func displayInterface(with homeViewModel: HomeViewModel) {
//        DispatchQueue.main.async {
//            self.viewModel = homeViewModel
//        }
//    }
}
