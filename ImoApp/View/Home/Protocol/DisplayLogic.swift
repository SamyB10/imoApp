//
//  DisplayLogic.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

@MainActor
public protocol HomeDisplayLogic {
    func displayInterface(with homeViewModel: HomeViewModel)
}

@MainActor
public protocol FilterDisplayLogic {
    func displayInterface(with filterHomeViewModel: FilterHomeViewModel)
}

