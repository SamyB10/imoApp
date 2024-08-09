//
//  HomeViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

struct HomeViewModel: Equatable, Hashable {
    let section: [HomeSectionViewModel]
}

extension HomeViewModel {
    static var viewModelSample: HomeViewModel {
        let randomCount = Int.random(in: 3...20)
        let title = HomeSectionViewModel.TypeSection.allCases
        var homeSection: [HomeSectionViewModel] = []
        let itemHouse = CardHomeViewModel(imageHouse: "coucher_soleil",
                                          titleHouse: "Title House",
                                          addressHouse: "Address House",
                                          numberRoom: .random(in: 0...10),
                                          price: .random(in: 50000.0...2000000.0),
                                          houseSurfaceArea: .random(in: 10...1000))

        for item in title {
            let section = HomeSectionViewModel(titleSection: item,
                                               itemHouse: Array(repeating: itemHouse,
                                                                count: randomCount))
            homeSection.append(section)
        }

        return HomeViewModel(section: homeSection)
    }
}
