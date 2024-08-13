//
//  Protocol.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//

import Foundation
public protocol ConfigureViewModel {
    associatedtype ViewModel: Equatable

    /// Configure the view with the given parameters
    /// - Parameter viewModel: The view model
    func configureViewModel(with viewModel: ViewModel)
}
