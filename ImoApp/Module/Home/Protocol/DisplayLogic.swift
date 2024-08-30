//
//  DisplayLogic.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

@MainActor
public protocol HomeDisplayLogic: AnyObject {
    func displayInterface(with homeViewModel: HomeViewModel)
}

@MainActor
public protocol FilterDisplayLogic: AnyObject {
    func displayInterface(with viewModel: FilterViewModel)
    func updatePicker(with value: Bool)
}

