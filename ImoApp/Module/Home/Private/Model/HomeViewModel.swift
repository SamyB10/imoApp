//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation
extension HomeViewModel {
    struct ViewModel: Equatable, Hashable {
        let section: [SectionViewModel]

        struct SectionViewModel: Equatable, Hashable {
            let header: HeaderViewModel
            let itemHouse: TypeCardHome
        }
    }
}
