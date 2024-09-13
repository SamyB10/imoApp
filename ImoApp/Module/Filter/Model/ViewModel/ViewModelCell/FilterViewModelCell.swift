//
//  FilterViewModelCell.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation
extension FilterViewModel {
    struct Cell: Hashable, Equatable {
        let apperance: Apperance
    }

    enum Apperance: Hashable, Equatable {
        case picker([Picker])
        case toggle(Toggle)
        case slider(Slider)
        case textField(TextField)
    }
}
