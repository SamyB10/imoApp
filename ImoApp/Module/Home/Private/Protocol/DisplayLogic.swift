//
//  DisplayLogic.swift
//  ImoApp
//
//  Created by Boussair Samy on 09/08/2024.
//

import Foundation

@MainActor
protocol HomeDisplayLogic: AnyObject {
    func displayInterface(with homeViewModel: HomeViewModel.ViewModel)
}
