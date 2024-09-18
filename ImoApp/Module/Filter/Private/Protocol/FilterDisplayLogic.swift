//
//  FilterDisplayLogic.swift
//  ImoApp
//
//  Created by Boussair Samy on 18/09/2024.
//

import Foundation
@MainActor
protocol FilterDisplayLogic: AnyObject {
    func displayInterface(with viewModel: FilterViewModel)
    func updatePicker(with value: Bool)
}
